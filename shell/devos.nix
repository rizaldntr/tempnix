{ pkgs, inputs, ... }:

let
  pkgWithCategory = category: package: { inherit package category; };
  nixfiles = pkgWithCategory "nixfiles";
in
{
  commands = with pkgs; [
    (nixfiles agenix)
    (nixfiles cachix)
    (nixfiles home-manager)
    (nixfiles inputs.nixos-generators.defaultPackage.${pkgs.system})
  ];
}