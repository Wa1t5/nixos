{ ... }:
{
  programs.cava = {
    enable = false;
    settings = import ./config.nix;
  };
}
