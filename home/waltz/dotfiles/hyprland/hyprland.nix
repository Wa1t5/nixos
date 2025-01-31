{ inputs, pkgs, lib, config, ... }:
{
  imports = [

  ];

  # Hyprland
  wayland.windowManager.hyprland = lib.mkIf config.wm.hyprland.enable {
    enable = true;
    systemd.enable = true;

    #xwayland.enable = false;
    extraConfig = '' 
                # Force electron apps to use wayland backend
                env = NIXOS_OZONE_WL,1

                # Add .local/bin to PATH
                env = PATH,/home/waltz/.local/bin:$PATH
            '' + import ./config.nix;

    #plugins = [
    #	    inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    #    inputs.hyprland-plugins-hyprgrass.packages.${pkgs.system}.default
    #    inputs.hyprland-plugins-hyprspace.packages.${pkgs.system}.default
    #];
  };
}
