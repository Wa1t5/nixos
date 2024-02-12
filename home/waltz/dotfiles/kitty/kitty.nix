{ ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = import ./config.nix;
  };
}
