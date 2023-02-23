{pkgs, ...}: {
  home.packages = [pkgs.nodePackages.pyright];
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = lspkind-nvim;
      type = "lua";
      config = builtins.readFile ../configs/lspkind.lua;
    }
    friendly-snippets
    {
      plugin = luasnip;
      type = "lua";
      config = builtins.readFile ../configs/luasnip.lua;
    }
    cmp_luasnip
    cmp-buffer
    cmp-path
    cmp-nvim-lsp
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile ../configs/cmp.lua;
    }
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ../configs/lspconfig.lua;
    }
    {
      plugin = null-ls-nvim;
      type = "lua";
      config = builtins.readFile ../configs/null-ls.lua;
    }
  ];
}
