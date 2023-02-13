{lib, ...}:
with lib; {
  options.vars = {
    email = mkOption {type = types.str;};
    username = mkOption {type = types.str;};

    home = mkOption {type = types.str;};
    configHome = mkOption {type = types.str;};

    sshPublicKey = mkOption {type = types.str;};
    timezone = mkOption {type = types.str;};
  };
}
