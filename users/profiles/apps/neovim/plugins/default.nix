{pkgs, ...}: {
  imports = [
    ./alpha.nix
    ./neo-tree.nix
    ./guess-indent.nix
    ./indent-blankline.nix
    ./treesitter.nix
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    impatient-nvim
    plenary-nvim
    nvim-web-devicons
  ];
}
