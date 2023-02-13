{pkgs, ...}: {
  programs.browserpass = {
    enable = true;
    browsers = ["firefox"];
  };
  home.packages = with pkgs; [pass];
}
