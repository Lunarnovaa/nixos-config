{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  inherit
    (config.theme)
    colors
    fonts
    ;
  toTOML = (pkgs.formats.toml {}).generate;
in {
  config = mkIf config.terminal.apps.alacritty {
    homes.lunarnova = {
      packages = with pkgs; [ alacritty ];
      files.".config/alacritty/alacritty.toml".source = (toTOML "alacritty config" {
        font = {
          size = fonts.size;
          normal.family = "${fonts.monospace}";
        };
        window = {
          dimensions = {
            lines = 28;
            columns = 101;
          };
          padding = {
            x = 6;
            y = 3;
          };
        };
        colors = {
          bright = {
            black = "0x${colors.base00}";
            blue = "0x${colors.base0D}";
            cyan = "0x${colors.base0C}";
            green = "0x${colors.base0B}";
            magenta = "0x${colors.base0E}";
            red = "0x${colors.base08}";
            white = "0x${colors.base06}";
            yellow = "0x${colors.base09}";
          };
          cursor = {
            cursor = "0x${colors.base06}";
            text = "0x${colors.base06}";
          };
          normal = {
            black = "0x${colors.base00}";
            blue = "0x${colors.base0D}";
            cyan = "0x${colors.base0C}";
            green = "0x${colors.base0B}";
            magenta = "0x${colors.base0E}";
            red = "0x${colors.base08}";
            white = "0x${colors.base06}";
            yellow = "0x${colors.base0A}";
          };
          primary = {
            background = "0x${colors.base00}";
            foreground = "0x${colors.base06}";
          };
        };
      });
    };
  };
}