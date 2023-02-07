{hmUsers, ...}: {
  home-manager.users = {inherit (hmUsers) nixos;};

  users.users.mrd = {
    password = "mrd";
    description = "default";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
