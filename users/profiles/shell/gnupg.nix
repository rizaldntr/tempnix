{pkgs, ...}: {
  home.packages = [pkgs.pinentry-gnome];

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    enableExtraSocket = true;
  };
}
