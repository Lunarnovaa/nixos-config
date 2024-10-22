{
  config,
  inputs,
  pkgs,
  options,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.hyprland.enable {
    programs.mako = {
      enable = true;
    };
  };
}