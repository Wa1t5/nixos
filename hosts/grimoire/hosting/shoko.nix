{ ... }:
{
  services.shoko = {
    enable = true;
    openFirewall = true;
  };
  users.users.shoko.isNormalUser = true;
  users.users.shoko.extraGroups = [ "media" ];
}
