{ ... }:
{
  services.slskd = {
    enable = false;
    openFirewall = false;
    domain = "127.0.0.1";
  };
}
