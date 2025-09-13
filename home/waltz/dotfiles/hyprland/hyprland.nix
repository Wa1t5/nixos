{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [

  ];

  # Hyprland
  wayland.windowManager.hyprland = lib.mkIf config.wm.hyprland.enable {
    enable = true;
    systemd.enable = true;

    #package = null;
    #portalPackage = null;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    #xwayland.enable = false;
    extraConfig =
      ''
        # Force electron apps to use wayland backend
        env = NIXOS_OZONE_WL,1

        # Add .local/bin to PATH
        env = PATH,/home/waltz/.local/bin:$PATH
      ''
      + import ./config.nix;

    plugins = [
      #inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
      #	    inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      #    inputs.hyprland-plugins-hyprgrass.packages.${pkgs.system}.default
      #    inputs.hyprland-plugins-hyprspace.packages.${pkgs.system}.default
    ];
  };
}
