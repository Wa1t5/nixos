{ ... }:
{
  #imports = [ ./discord-krisp.nix ];

  programs.moonlight-mod = {
    enable = true;
  };


  #programs.discord = {
  #  enable = true;
  #  wrapDiscord = true;
  #};
}
