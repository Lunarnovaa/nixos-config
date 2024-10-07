{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./bootloader.nix
    ./locales.nix
    ./networking.nix
    ./nix-ld.nix
    ./nvidia.nix
    ./printing.nix
  ];

  # ALlow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}