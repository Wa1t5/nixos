{ pkgs, ... }:
{    
  # Create waltz user account
  users.users.waltz = {
    isNormalUser = true;
    extraGroups = [ "realtime" "wheel" "audio" "video" "input" ]; # Enable ‘sudo’ for the user
    shell = pkgs.zsh;
  };

}
