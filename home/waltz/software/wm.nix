{
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}:
{
  imports = [
    ../dotfiles/hyprland/hyprland.nix
    ../dotfiles/umbriel/umbriel.nix
    ../dotfiles/noctalia/noctalia.nix
    ../dotfiles/ime/ime.nix
    ../dotfiles/fontconfig/fontconfig.nix
    ../dotfiles/mako/mako.nix
    ../dotfiles/hyprlock/hyprlock.nix
    ../dotfiles/vicinae/vicinae.nix
    ../dotfiles/waybar/waybar.nix
    ../dotfiles/rofi/rofi.nix
    ../dotfiles/tofi/tofi.nix
    ../dotfiles/yazi/yazi.nix
    ../dotfiles/walker/walker.nix
  ];

  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
      # XDG tools
      libnotify
      xdg-utils

      # Provide some DE functionalities
      hyprsunset
      brightnessctl
      wl-clipboard
      slurp
      grim
      waybar
      awww
      syshud

      # Media
      playerctl

      # File Manager
      pcmanfm

      # Image viewer
      imv
    ];
  };
}
