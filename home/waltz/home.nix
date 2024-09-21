{ inputs, ... }:
{
  # Set usrename and home dir
  home.username = "waltz";
  home.homeDirectory = "/home/waltz";

  imports = [
    # Packages
    ./packages.nix

    # Services
    ./services.nix

    # Extra paths to add to home
    ./extra-paths.nix

    # Xdg
    ./xdg-configuration.nix

    # Specify xdg paths
    ./xdg-paths.nix

    # Toplevel config
    ./config.nix

    # import spicetify
    inputs.spicetify-nix.homeManagerModules.default

    # Import catppuccin
    inputs.catppuccin.homeManagerModules.catppuccin

    # Import walker
    inputs.walker.homeManagerModules.default
  ];

  # Enable wayland for electron ozone apps
  home.sessionVariables = { NIXOS_OZONE_WL = "1"; PATH = "/home/waltz/.local/bin:$PATH"; };

  home.stateVersion = "24.05";
}
