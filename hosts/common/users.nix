{ pkgs, sops, config, ... }:
{
  sops.secrets."waltz_password" = { };

  # Create waltz user account
  users.users.waltz = {
    isNormalUser = true;
    extraGroups = [ "realtime" "wheel" "audio" "video" "input" "wireshark" "networkmanager" ];
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets."waltz_password".path;
  };

}
