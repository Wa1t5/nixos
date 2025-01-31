{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "NotoMono Nerd Font Mono" ];
      serif = [ "NotoSerif Nerd Font Mono" ];
      sansSerif = [ "NotoSansM Nerd Font Mono" ];
      emoji = [ "Noto Emoji" ];
    };
  };
}
