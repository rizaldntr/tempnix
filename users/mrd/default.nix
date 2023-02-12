{hmUsers, ...}: {
  home-manager.users = {inherit (hmUsers) mrd;};

  users.users.mrd = {
    password = "mrd";
    description = "default";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
