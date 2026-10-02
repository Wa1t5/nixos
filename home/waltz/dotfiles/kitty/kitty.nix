{ ... }:
{
  programs.kitty = {
    enable = true;
    #themeFile = "Noctalia";
    extraConfig = import ./config.nix;
  };
}
