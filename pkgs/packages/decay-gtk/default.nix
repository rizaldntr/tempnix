{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  sources,
  ...
}:
stdenv.mkDerivation rec {
  inherit (sources.decay-gtk) pname version src;

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -r Themes/* $out/share/themes
  '';

  meta = {
    description = "Revamped GTK Theme for decay (Decayce Variant)";
    homepage = "https://github.com/decaycs/decay-gtk";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.decaycs];
  };
}