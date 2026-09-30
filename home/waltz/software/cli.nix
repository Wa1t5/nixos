{ pkgs, ... }:
{
  imports = [
    ../dotfiles/ssh/ssh.nix
    ../dotfiles/beets/beets.nix
    ../dotfiles/mpv/mpv.nix
    ../dotfiles/kitty/kitty.nix
    ../dotfiles/nixvim/nixvim.nix
    ../dotfiles/gpg/gpg.nix
    ../dotfiles/zsh/zsh.nix
  ];

  home.packages = with pkgs; [
    # Terminal
    kitty
    direnv

    # CLI
    btop
    fastfetch
    #imagemagick
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
