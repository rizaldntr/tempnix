{config, ...}:
with config.colors.base; {
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      bg = "${black}";
      "bg+" = "${blue}";
      fg = "${foreground}";
      "fg+" = "${white}";
      hl = "${green}";
      "hl+" = "${black}";
      border = "${white}";
      marker = "${yellow}";
      pointer = "${white}";
      header = "${yellow}";
      info = "${blue}";
      gutter = "${black}";
    };
  };
}
