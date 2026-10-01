{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:

{
  imports = [
    inputs.aagl.nixosModules.default
    inputs.umbriel.nixosModules.default
    ./dotfiles/noctalia-greeter/noctalia-greeter.nix
    ./dotfiles/steam/steam.nix
    ./dotfiles/aagl/aagl.nix
    ./config.nix # Current file is imported by uplevel options.nix thus needing to import config manually
  ];

  # Gnome keyring
  services.gnome.gnome-keyring = lib.mkIf config.wm.enable {
    enable = true;
  };

  # Kde partition manager
  programs.partition-manager.enable = true;

  programs.seahorse = lib.mkIf config.wm.enable {
    enable = true;
  };

  # Dconfig
  programs.dconf.enable = true;

  # Enable umbriel 2-nd time
  programs.umbriel = {
    enable = config.wm.umbriel.enable;
  };
}
