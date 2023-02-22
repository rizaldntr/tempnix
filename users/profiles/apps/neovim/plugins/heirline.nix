{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    bufdelete-nvim
    {
      plugin = heirline-nvim;
      type = "lua";
      config = builtins.readFile ../configs/heirline.lua;
    }
  ];
}
