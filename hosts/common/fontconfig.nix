{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-emoji-blob-bin
      nerd-fonts.jetbrains-mono
      nerd-fonts.noto
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Noto Sans Mono" "Noto Sans Mono CJK JP" ];
        sansSerif = [ "Noto Serif" "Noto Serif CJK JP" ];
        serif = [ "Noto Serif" "Noto Serif CJK JP" ];
        emoji = [ "Noto Emoji" "Noto Music" ];
      };
    };
  };
}
