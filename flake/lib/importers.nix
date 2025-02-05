{lib}: let
  inherit (lib.trivial) pipe;
  inherit (lib.strings) hasSuffix hasPrefix;
  inherit (lib.lists) flatten;
  inherit (lib.attrsets) mapAttrsToList filterAttrs;
  inherit (builtins) filter readDir map concatLists;

  # taken from nixpkgs and modified by me so that any directories
  # with the prefix _ would not have their files imported.
  # yes, i decided to rewrite it as a pipe function.
  # please note you can find the original function under
  # lib.filesystem.listFilesRecursive
  listFilesRecursiveClean = path:
    pipe path [
      readDir
      (filterAttrs (n: _: (!hasPrefix "_" n))) # this is the one part i added to the function
      (mapAttrsToList (
        name: type:
          if type == "directory"
          then listFilesRecursiveClean (path + "/${name}")
          else path + "/${name}"
      ))
      flatten
    ];

  importNixRecursive = path:
    pipe path [
      listFilesRecursiveClean
      (filter (hasSuffix ".nix")) # Filter non-nix files
    ];

  importModule = path:
    pipe path [
      importNixRecursive
      (filter (n: !hasSuffix "module.nix" n)) # Filter out module.nix
    ];

  # this function and its use was inspired by notashelf's mkModuleTree schema
  mkModuleList = {
    hostName,
    profiles ? [],
    desktop ? [],
    specialImports ? [],
  }: let
    moduleDir = ../../modules;
  in (
    flatten (
      concatLists [
        (map (n: (moduleDir + /desktop + /${n} + /module.nix)) desktop)
        (map (n: (moduleDir + /profiles + /${n} + /module.nix)) profiles)

        (importNixRecursive (moduleDir + /options))
        (importNixRecursive (moduleDir + /common))
        (importNixRecursive (../../hosts + /${hostName}))

        specialImports
      ]
    )
  );
in {
  inherit
    listFilesRecursiveClean
    importNixRecursive
    importModule
    mkModuleList
    ;
}
