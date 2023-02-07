{...}: {
  users.users.mrd = {
    password = "mrd";
    description = "default";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
