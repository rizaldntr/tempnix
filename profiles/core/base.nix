{
  config,
  pkgs,
  lib,
  ...
}: {
  # systemd.services.NetworkManager-wait-online.enable = false;
  boot.cleanTmpDir = true;

  services.dbus.packages = [pkgs.gcr];

  environment = {
    defaultPackages = with pkgs; [
      file
      less
      unzip
      wget
      zip
      docker-compose
      alejandra
      sumneko-lua-language-server
      nil
    ];

    shellAliases = let
      ifSudo = lib.mkIf config.security.sudo.enable;
    in {
      # nix
      nrb = ifSudo "sudo nixos-rebuild switch --flake '.#gada'";
      nrt = ifSudo "sudo nixos-rebuild test --flake '.#gada'";
      nso = ifSudo "sudo nix-store --optimise";
      ncgd = ifSudo "sudo nix-collect-garbage -d";

      # systemd
      ctl = "systemctl";
      stl = ifSudo "s systemctl";
      utl = "systemctl --user";
      ut = "systemctl --user start";
      un = "systemctl --user stop";
      up = ifSudo "s systemctl start";
      dn = ifSudo "s systemctl stop";
      jtl = "journalctl";
    };
  };

  networking = {
    useDHCP = false;
    networkmanager.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  nix = {
    package = pkgs.nixUnstable;
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      sandbox = true;
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      min-free = 536870912;
      keep-outputs = true;
      keep-derivations = true;
      fallback = true;
    };
  };

  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults timestamp_timeout=300";
  };

  services = {
    earlyoom = {
      enable = true;
      enableNotifications = true;
      freeMemThreshold = 5;
    };
  };

  virtualisation.docker.enable = true;
  services.xserver.libinput.enable = true;
  system.stateVersion = lib.mkDefault "22.11";
}
