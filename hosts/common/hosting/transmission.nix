{ lib, ... }:
{
  services.transmission = {
    enable = false;
    openFirewall = false;
    settings.download-dir = "/media/downloads";
  };
}
