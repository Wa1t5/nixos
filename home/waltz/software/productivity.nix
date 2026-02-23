{ pkgs, inputs,  ... }: {
  imports = [
    ../dotfiles/emacs/emacs.nix
    ../dotfiles/zed/zed.nix
    ../dotfiles/vscode/vscode.nix
    ../dotfiles/git/git.nix
    ../dotfiles/obs-studio/obs-studio.nix
  ];

  home.packages = with pkgs; [
    # Text editing / Coding / RSE
    obsidian

    # Study
    anki

    # Game dev
    unityhub
    aseprite
  ];
}
