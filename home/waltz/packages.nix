{ inputs, pkgs, ... }:
{  
  imports = [
    # ./dotfiles/stylix/stylix.nix
    ./dotfiles/cava/cava.nix
    ./dotfiles/discord/discord.nix
    ./dotfiles/eww/eww.nix
    ./dotfiles/fuzzel/fuzzel.nix
    ./dotfiles/git/git.nix
    ./dotfiles/gpg/gpg.nix
    ./dotfiles/hyprland/hyprland.nix
    ./dotfiles/kitty/kitty.nix
    ./dotfiles/librewolf/librewolf.nix
    ./dotfiles/mpv/mpv.nix
    ./dotfiles/ncmpcpp/ncmpcpp.nix
    ./dotfiles/nixvim/nixvim.nix
    ./dotfiles/obs-studio/obs-studio.nix
    ./dotfiles/spicetify/spicetify.nix
    ./dotfiles/swaylock/swaylock.nix
    ./dotfiles/waybar/waybar.nix
    ./dotfiles/zsh/zsh.nix
  ];

  home.packages = with pkgs; [
      # Text editing / Coding
      obsidian
      godot_4

      # Games
      osu-lazer-bin

      # Virtualisation
      distrobox

      # Terminal
      kitty
      direnv
      # ( lunarvim.overrideAttrs { nvimAlias = false; } )
     
      # CLI
      btop
      fastfetch
      yazi
      imagemagick

      # CLI (GNU tools replacement)            
      lsd
      bat
      dysk
      delta
      du-dust
      fd

      # Torrent
      qbittorrent
  
      # Media
      playerctl
      spotify

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
      tofi
      wl-clipboard
      slurp
      grim
      waybar
      swww
      
      # Manage audio
      helvum
      pavucontrol

      # Fonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra
      noto-fonts-cjk
      font-awesome
      #(nerdfonts.override { fonts = [ "Noto" ]; })
  ];
}
