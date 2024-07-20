{ inputs, pkgs, ... }:
{
  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;
    #xwayland.enable = false;
    systemd.variables = [ "--all" ];
    extraConfig = '' 
                # Force electron apps to use wayland backend
                env = NIXOS_OZONE_WL,1

                # Add .local/bin to PATH
                env = PATH,/home/waltz/.local/bin:$PATH

                # Start gnome polkit
                exec-once = "systemctl --user start app-polkit\\x2dgnome\\x2dauthentication\\x2dagent\\x2d1@autostart.service &"
                exec-once = "systemctl --user start polkit-gnome-authentication-agent-1.service &"
            '' + import ./config.nix;

    #plugins = [
    #	    inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    #    inputs.hyprland-plugins-hyprgrass.packages.${pkgs.system}.default
    #    inputs.hyprland-plugins-hyprspace.packages.${pkgs.system}.default
    #];
  };
}
