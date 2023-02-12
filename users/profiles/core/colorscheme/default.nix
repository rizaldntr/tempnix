{inputs, pkgs, ...}:

let
  lib = inputs.nix-colors.lib-core;
in
{
  colorScheme = lib.schemeFromYAML "decayce" (builtins.readFile ./decayce.yaml);
}