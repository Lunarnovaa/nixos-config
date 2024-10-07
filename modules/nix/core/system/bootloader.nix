{
  pkgs,
  config,
  ...
}: {
  # Configure the Bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };
}