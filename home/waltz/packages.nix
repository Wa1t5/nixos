{ pkgs, inputs, ... }: {
  imports = [
    ./software/audio.nix
    ./software/cli.nix
    ./software/de.nix
    ./software/games.nix
    ./software/media.nix
    ./misc.nix
    ./software/productivity.nix
    ./software/security.nix
    ./software/social.nix
    ./software/theming.nix
    ./software/virtualisation.nix
    ./software/wm.nix
  ];
}
