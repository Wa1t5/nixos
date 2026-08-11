{ config, ... }: {
  services.openssh = {
    enable = true;
    openFirewall = config.services.openssh.enable;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };
}
