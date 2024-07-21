{ pkgs, ... }:
{
  # Create waltz user account
  users.users.waltz = {
    isNormalUser = true;
    extraGroups = [ "realtime" "wheel" "audio" "video" "input" "wireshark" ];
    shell = pkgs.zsh;
  };

}
