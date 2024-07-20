{ ... }:
{
  programs.librewolf = {
    enable = true;
    settings = import ./config.nix;
  };
}
