{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Noto Sans Mono" "Noto Sans Mono CJK JP" ];
      sansSerif = [ "Noto Serif" "Noto Serif CJK JP" ];
      serif = [ "Noto Serif" "Noto Serif CJK JP" ];
      emoji = [ "Noto Emoji" "Noto Music" ];
    };
  };
}
