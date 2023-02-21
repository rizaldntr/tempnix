{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter.withPlugins (p: [
        p.python
        p.lua
        p.nix
        p.sql
      ]);
      type = "lua";
      config = builtins.readFile ../configs/treesitter.lua;
    }
  ];
}
