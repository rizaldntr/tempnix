{ self, config, pkgs, ... }:

{
  vars = rec {
    email    = "rizaldntr@gmail.com";
    username = "mrd";

    home                = "/home/${username}";
    configHome          = (builtins.getAttr username config.home-manager.users).xdg.configHome;

    timezone     = "Asia/Jakarta";
    sshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILq0Jl7E5vfc27gHp1Lod59YFkf7xAyQdfJ6RFLVpltS rizaldntr@gmail.com";
  };
}