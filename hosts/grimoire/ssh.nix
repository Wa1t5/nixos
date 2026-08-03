{ config, ... }: {
  services.openssh = {
    enable = false;
    openFirewall = config.services.openssh.enable;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };
}
