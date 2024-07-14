{ pkgs, ... }:
{  
  imports = [
    # ./dotfiles/stylix/stylix.nix
    ./dotfiles/vscode/vscode.nix
    ./dotfiles/cava/cava.nix
    ./dotfiles/discord/discord.nix
    #./dotfiles/eww/eww.nix
    ./dotfiles/fuzzel/fuzzel.nix
    ./dotfiles/git/git.nix
    ./dotfiles/gpg/gpg.nix
    #./dotfiles/hyprland/hyprland.nix
    ./dotfiles/kitty/kitty.nix
    ./dotfiles/mpv/mpv.nix
    ./dotfiles/ncmpcpp/ncmpcpp.nix
    #./dotfiles/nixvim/nixvim.nix
    ./dotfiles/obs-studio/obs-studio.nix
    ./dotfiles/spicetify/spicetify.nix
    #./dotfiles/hyprlock/hyprlock.nix
    #./dotfiles/waybar/waybar.nix
    ./dotfiles/zsh/zsh.nix
  ];

  home.packages = with pkgs; [
      # Text editing / Coding
      obsidian
      lunarvim
      godot_4

      # Browser
      brave

      # Virtualisation
      distrobox

      # Terminal
      kitty
      direnv
     
      # CLI
      btop
      fastfetch
      yazi
      imagemagick
      yt-dlp

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
      # spotify (disable in favor of spicetify-nix)

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

      # Fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-emoji-blob-bin
      jetbrains-mono    
      ( pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })

      # Manage audio
      helvum
      pavucontrol
  ];
}
