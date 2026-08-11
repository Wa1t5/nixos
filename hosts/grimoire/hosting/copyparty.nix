{ ... }:
{
  services.copyparty = {
    enable = true;
    user = "copyparty";
    group = "copyparty";
    settings = {
      i = "0.0.0.0";
      p = [ "3210" ];
    };

    accounts = {
      waltz = {
        passwordFile = "/var/lib/secrets/copyparty/waltz-pwd";
      };
    };

    volumes = {
      "/" = {
        path = "/media";
        access = {
          r = "*";
          rwmd = [ "waltz" ];
        };
      };
    };
  };

  users.users.copyparty.extraGroups = [ "media" ];
}
