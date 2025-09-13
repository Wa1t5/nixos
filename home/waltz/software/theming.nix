{ pkgs, ... }: {
  imports = [
    ../dotfiles/stylix/stylix-hm.nix
    ../dotfiles/catppuccin/catppuccin.nix
  ];

  home.packages = with pkgs; [
    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto

    # icon themes
    adwaita-icon-theme
  ];
}
