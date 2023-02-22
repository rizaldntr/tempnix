final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) {};

  decay-gtk = final.callPackage (import ./packages/decay-gtk) {};
  heirline-nvim = final.callPackage (import ./packages/heirline-nvim) {};
}
