{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    kde.enable =
      lib.mkEnableOption "enables kde";
  };

  config = lib.mkIf config.kde.enable {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
