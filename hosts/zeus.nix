#  _____
# |__  /___ _   _ ___
#   / // _ \ | | / __|
#  / /|  __/ |_| \__ \
# /____\___|\__,_|___/
{suites, ...}: {
  ### root password is empty by default ###
  imports = suites.base;

  # Boot #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # GPU #
  services.xserver.videoDrivers = ["nvidia"];
  hardware.opengl.enable = true;

  networking.wireless.enable = false;
  networking.networkmanager.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
    };
  };
}
