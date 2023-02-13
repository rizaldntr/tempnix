{pkgs, ...}: {
  home.packages = [pkgs.pinentry-gnome];

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };
}
