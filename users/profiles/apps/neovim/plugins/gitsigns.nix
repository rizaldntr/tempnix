{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = builtins.readFile ../configs/gitsigns.lua;
    }
  ];
}
