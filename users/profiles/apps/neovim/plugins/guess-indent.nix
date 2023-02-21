{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = guess-indent-nvim;
      type = "lua";
      config = builtins.readFile ../configs/guess-indent.lua;
    }
  ];
}
