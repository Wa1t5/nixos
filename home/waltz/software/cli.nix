{ pkgs, ... }:
{
  imports = [
    ../dotfiles/ssh/ssh.nix
    ../dotfiles/beets/beets.nix
    #../dotfiles/eww/eww.nix
    ../dotfiles/mpv/mpv.nix
    ../dotfiles/kitty/kitty.nix
    #../dotfiles/foot/foot.nix
    ../dotfiles/nixvim/nixvim.nix
    ../dotfiles/gpg/gpg.nix
    ../dotfiles/cava/cava.nix
    ../dotfiles/zsh/zsh.nix
    ../dotfiles/fish/fish.nix
    ../dotfiles/starship/starship.nix
    ../dotfiles/ghostty/ghostty.nix
    #../dotfiles/ncmpcpp/ncmpcpp.nix

  ];

  home.packages = with pkgs; [
    # Terminal
    kitty
    direnv

    # CLI
    btop
    fastfetch
    imagemagick
    yt-dlp
    ripgrep

    # CLI (GNU tools replacement)
    p7zip
    lsd
    bat
    dysk
    #delta
    dust
    fd

    # Sudo shim
    doas-sudo-shim

    # Network
    impala

    # Nix
    nixos-generators
    deadnix
    nix-tree
  ];
}
