{
  hmUsers,
  pkgs,
  config,
  ...
}: {
  home-manager.users = {inherit (hmUsers) mrd;};

  users.defaultUserShell = pkgs.fish;

  users.users.mrd = {
    password = "mrd";
    description = "default";
    isNormalUser = true;
    extraGroups = ["wheel"] 
    ++ pkgs.lib.optional config.virtualisation.docker.enable "docker";
  };
}
