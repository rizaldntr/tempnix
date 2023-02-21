{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "${config.vars.username}";
      };
      default_session = initial_session;
    };
  };

  environment.etc."greetd/environments".text = ''
    Hyprland
  '';
}
