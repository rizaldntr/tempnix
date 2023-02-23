{pkgs, ...}: {
  home.packages = with pkgs; [
    python39
    python39Packages.pip
    python39Packages.black
  ];
}
