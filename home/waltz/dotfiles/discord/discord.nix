{ ... }:
{
  imports = [ ./discord-krisp.nix ];

  programs.discord = {
    enable = false;
    wrapDiscord = true;
  };
}
