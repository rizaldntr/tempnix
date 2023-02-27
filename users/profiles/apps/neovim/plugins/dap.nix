{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-dap;
      type = "lua";
      config = builtins.readFile ../configs/nvim-dap.lua;
    }
    {
      plugin = nvim-dap-ui;
      type = "lua";
      config = builtins.readFile ../configs/dapui.lua;
    }
  ];
}
