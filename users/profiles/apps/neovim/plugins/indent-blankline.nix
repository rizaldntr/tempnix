{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = builtins.readFile ../configs/indent-blankline.lua;
    }
  ];
}
