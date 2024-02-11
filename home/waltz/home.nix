{ pkgs, inputs, ... }:
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

            # Discord krisp
            ./discord-krisp.nix

            # Hyprland
            ./dotfiles/hyprland/hyprland.nix

            # import spicetify
            inputs.spicetify-nix.homeManagerModule

            # Import Stylix
            inputs.stylix.homeManagerModules.stylix

            # Stylix
            ./dotfiles/stylix/stylix.nix
        ];
       
        # Enable wayland for electron ozone apps
        # home.sessionVariables = { NIXOS_OZONE_WL = "1"; };
        home.sessionVariables = { PATH = "/home/waltz/.local/bin:$PATH"; };

        home.stateVersion = "24.05";
}
