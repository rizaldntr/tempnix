{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = alpha-nvim;
      type = "lua";
      config = builtins.readFile ../configs/alpha.lua;
    }
  ];
}
