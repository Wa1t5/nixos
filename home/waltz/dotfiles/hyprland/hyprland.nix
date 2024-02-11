{ inputs, pkgs, ... }:
{  
        # Hyprland
        wayland.windowManager.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${pkgs.system}.hyprland;            
            systemd.enable = true;
            xwayland.enable = true;
            extraConfig = '' 
                # Force electron apps to use wayland backend
                # env = NIXOS_OZONE_WL,1

                # Add .local/bin to PATH
                env = PATH,/home/waltz/.local/bin:$PATH
            '' + import ./config.nix;

            # plugins = [
            #    inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
            #    inputs.hyprland-plugins-hyprgrass.packages.${pkgs.system}.default
            #];
        };
 }
