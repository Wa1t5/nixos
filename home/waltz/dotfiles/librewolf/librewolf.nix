{ ... }:
{
  programs.librewolf = {
    enable = true;
    settings = import ./osConfig.nix;
  };
}
