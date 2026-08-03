{ pkgs
, sops
, config
, ...
}:
{
  # Create waltz user account
  users.users.waltz = {
    isNormalUser = true;
    extraGroups = [
      "realtime"
      "wheel"
      "audio"
      "video"
      "input"
      "wireshark"
      "networkmanager"
      "libvirtd"
      "gamemode"
      "hermes"
    ];
    shell = pkgs.zsh;
  };

}
