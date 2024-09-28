{ pkgs, lib, config, inputs, ... }:
{
  imports = [
    ./dotfiles/catppuccin/catppuccin.nix
    ./dotfiles/vscode/vscode.nix
    ./dotfiles/beets/beets.nix
    ./dotfiles/cava/cava.nix
    ./dotfiles/discord/discord.nix
    ./dotfiles/ssh/ssh.nix
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
    ./dotfiles/ime/ime.nix
    ./dotfiles/walker/walker.nix
    ./dotfiles/gnome/gnome.nix
  ];



  home.packages = with pkgs; [
    # Text editing / Coding / RSE
    obsidian
    godot_4

    # Virtualisation
    gnome.gnome-boxes

    # Torrenting
    qbittorrent

    # Study
    anki

    # BTC
    wasabiwallet
    electrum

    # Browser
    inputs.zen-browser.packages."${pkgs.system}".specific
    vivaldi

    # Video editor
    #davinci-resolve
    kdenlive

    # Drawing
    krita

    # Music
    feishin
    nicotine-plus

    # Video
    celluloid

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

    # Nix
    nixpkgs-fmt # Nix code formatter
    nixos-generators
    deadnix

    # Torrent
    qbittorrent

    # Media
    playerctl

    # Chat
    vesktop

    # Security
    keepassxc
    age

    # Sync
    syncthing

    # XDG tools
    libnotify
    xdg-utils

    # Fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })

    # icon themes
    adwaita-icon-theme

    # Manage audio
    helvum
    pavucontrol

    (lib.mkIf config.wm.enable (
      # File Manager
      pcmanfm

        # Image viewer
        imv

        # Provide some DE functionalities
        brightnessctl
        wl-clipboard
        slurp
        grim
        waybar
        swww
    ))
  ];
}
