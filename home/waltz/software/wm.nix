{ pkgs, inputs, ... }: {
  imports = [
    ../dotfiles/hyprland/hyprland.nix
    ../dotfiles/ime/ime.nix
    ../dotfiles/fontconfig/fontconfig.nix
    ../dotfiles/mako/mako.nix
    ../dotfiles/hyprlock/hyprlock.nix
    ../dotfiles/waybar/waybar.nix
    ../dotfiles/rofi/rofi.nix
    ../dotfiles/yazi/yazi.nix
    #../dotfiles/walker/walker.nix
  ];

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
    swww
    syshud

    # Media
    playerctl

    # File Manager
    pcmanfm

    # Image viewer
    imv
  ];
}
