{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [./plugins];

  programs.neovim = {
    enable = true;
    extraLuaConfig = lib.concatStrings [
      (builtins.readFile ./core.lua)
      (builtins.readFile ./options.lua)
      (import ./colors.nix {inherit (config) colors;})
      (builtins.readFile ./theme.lua)
      (builtins.readFile ./mappings.lua)
      (builtins.readFile ./autocmds.lua)
    ];
  };
}
