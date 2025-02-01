{ ... }:
{
  programs.cava = {
    enable = true;
    settings = import ./config.nix;
  };
}
