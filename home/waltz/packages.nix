{ pkgs, inputs, ... }:
{
  imports = [
    ./dotfiles/catppuccin/catppuccin.nix
    ./dotfiles/vscode/vscode.nix
    ./dotfiles/cava/cava.nix
    ./dotfiles/discord/discord.nix
    #./dotfiles/eww/eww.nix
    ./dotfiles/git/git.nix
    ./dotfiles/gpg/gpg.nix
    ./dotfiles/hyprland/hyprland.nix
    ./dotfiles/kitty/kitty.nix
    ./dotfiles/mpv/mpv.nix
    #./dotfiles/ncmpcpp/ncmpcpp.nix
    ./dotfiles/nixvim/nixvim.nix
    ./dotfiles/obs-studio/obs-studio.nix
    ./dotfiles/spicetify/spicetify.nix
    ./dotfiles/hyprlock/hyprlock.nix
    ./dotfiles/waybar/waybar.nix
    ./dotfiles/zsh/zsh.nix
    ./dotfiles/rofi/rofi.nix
    ./dotfiles/yazi/yazi.nix
    #./dotfiles/stylix/stylix.nix
    ./dotfiles/fcitx5/fcitx5.nix
    ./dotfiles/walker/walker.nix
  ];

  home.packages = with pkgs; [
    # Text editing / Coding / RSE
    obsidian
    godot_4

    # File Manager
    pcmanfm

    # Image viewer
    imv

    # Study
    anki

    # Browser
    #brave
    inputs.zen-browser.packages."${pkgs.system}".specific

    # Terminal
    kitty
    direnv

    # CLI
    btop
    fastfetch
    imagemagick
    yt-dlp

    # CLI (GNU tools replacement)            
    lsd
    bat
    dysk
    #delta
    du-dust
    fd
    nixpkgs-fmt # Nix code formatter

    # Torrent
    qbittorrent

    # Media
    playerctl

    # Chat
    vesktop

    # Security
    keepassxc
    gnupg

    # Sync
    syncthing

    # XDG tools
    libnotify
    xdg-utils

    # Provide some DE functionalities
    brightnessctl
    wl-clipboard
    slurp
    grim
    waybar
    swww

    # Fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })

    # Manage audio
    helvum
    pavucontrol
  ];
}
