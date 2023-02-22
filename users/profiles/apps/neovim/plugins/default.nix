{pkgs, ...}: {
  imports = [
    ./alpha.nix
    ./neo-tree.nix
    ./guess-indent.nix
    ./indent-blankline.nix
    ./treesitter.nix
    ./heirline.nix
    ./gitsigns.nix
    ./aerial.nix
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    impatient-nvim
    plenary-nvim
    nvim-web-devicons
  ];
}
