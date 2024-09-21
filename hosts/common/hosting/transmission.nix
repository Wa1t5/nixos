{ lib, ... }:
{
  services.transmission = {
    enable = false;
    openFirewall = false;
  };
}
