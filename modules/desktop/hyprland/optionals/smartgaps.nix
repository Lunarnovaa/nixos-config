{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (config.hyprland.enable && config.hyprland.smartgaps) {
    programs.hyprland.settings = {
      windowrulev2 = [
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];

      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
    };
  };
}
