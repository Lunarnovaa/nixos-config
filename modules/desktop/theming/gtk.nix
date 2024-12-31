{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (config.theme) fonts;
  inherit (lib.extendedLib.generators.gtk) finalGtk2Text toGtk3Ini;

  gtk-settings = {
    gtk-icon-theme-name = "Papirus-Dark";

    gtk-theme-name = "catppuccin-mocha-red-standard+normal";

    gtk-font-name = "${fonts.sans-serif} ${builtins.toString fonts.size}";

    gtk-cursor-theme-name = "Bibata-Modern-Classic";

    gtk-application-prefer-dark-theme = true;
  };
in {
  hjem.users.lunarnova = {
    files = {
      ".gtkrc-2.0".text = finalGtk2Text {attrs = gtk-settings;};
      ".config/gtk-3.0/settings.ini".text = toGtk3Ini {
        Settings = gtk-settings;
      };
      ".config/gtk-4.0/settings.ini".text = toGtk3Ini {
        Settings = gtk-settings;
      };
    };
    packages = with pkgs; [
      (catppuccin-gtk.override {
        accents = ["red"];
        variant = "mocha";
        size = "standard";
        tweaks = ["normal"];
      })
      (catppuccin-papirus-folders.override {
        accent = "red";
        flavor = "mocha";
      })
      bibata-cursors
    ];
  };
}
