{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nui-nvim
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = builtins.readFile ../configs/neo-tree.lua;
    }
  ];
}
