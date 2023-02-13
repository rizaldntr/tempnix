{
  pkgs,
  config,
  ...
}: let
  enable_animations = "yes";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    disableAutoreload = true;
    systemdIntegration = true;
    extraConfig = import ./config.nix {
      inherit enable_animations;
      inherit (config) colors;
    };
  };

  home.packages = with pkgs; [
    wf-recorder
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    swaybg
    slurp
    grim
    pavucontrol
  ];

  xdg.configFile.".wallpaper.jpg".source = ./assets/wallpaper.jpg;
}
