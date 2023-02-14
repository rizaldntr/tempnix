{pkgs, ...}: {
  home.packages = with pkgs; [slack slack-term];
}
