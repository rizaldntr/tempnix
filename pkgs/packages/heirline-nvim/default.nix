{
  pkgs,
  sources,
  ...
}:
pkgs.vimUtils.buildVimPluginFrom2Nix rec {
  inherit (sources.decay-gtk) pname version src;

  meta = {
    homepage = src.url;
  };
}
