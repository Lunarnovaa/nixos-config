{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  theme = {
    colors = {
      # Credit for this conversion can be found here https://github.com/tinted-theming/schemes/pull/33
      base00 = "24273a"; # base
      base01 = "1e2030"; # mantle
      base02 = "363a4f"; # surface0
      base03 = "494d64"; # surface1
      base04 = "5b6078"; # surface2
      base05 = "cad3f5"; # text
      base06 = "f4dbd6"; # rosewater
      base07 = "b7bdf8"; # lavender
      base08 = "ed8796"; # red
      base09 = "f5a97f"; # peach
      base0A = "eed49f"; # yellow
      base0B = "a6da95"; # green
      base0C = "8bd5ca"; # teal
      base0D = "8aadf4"; # blue
      base0E = "c6a0f6"; # mauve
      base0F = "f0c6c6"; # flamingo
      base10 = "1e2030"; # mantle - darker background
      base11 = "181926"; # crust - darkest background
      base12 = "ee99a0"; # maroon - bright red
      base13 = "f4dbd6"; # rosewater - bright yellow
      base14 = "a6da95"; # green - bright green
      base15 = "91d7e3"; # sky - bright cyan
      base16 = "7dc4e4"; # sapphire - bright blue
      base17 = "f5bde6"; # pink - bright purple
    };
    fonts = {
      serif = "Inter";
      sans-serif = "Roboto Serif";
      monospace = "Fira Code";
      size = 11;
    };
  };
}