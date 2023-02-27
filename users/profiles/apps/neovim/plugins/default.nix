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
    ./telescope.nix
    ./dressing.nix
    ./smart-splits.nix
    ./toggleterm.nix
    ./lsp.nix
    ./dap.nix
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    impatient-nvim
    plenary-nvim
    nvim-web-devicons
  ];
}
