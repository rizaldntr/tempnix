{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = smart-splits-nvim;
      type = "lua";
      config = builtins.readFile ../configs/smart-splits.lua;
    }
  ];
}
