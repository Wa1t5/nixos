{
  description = "General Waltz Config";

    inputs = {
        # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-stable.url = "github:NixOS/nixpkgs/23.11";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        hyprland.url = "github:hyprwm/Hyprland";
        spicetify-nix.url = "github:the-argus/spicetify-nix";
    };

    outputs = { nixpkgs, ... } @inputs: {
        nixosConfigurations = {
            # Emperor Host
            "emperor" = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    # Import config.nix
                    ./hosts/emperor/configuration.nix

                    # Softwares that need to be defined in
                    # configuration.nix but I removed
                    # for modularity
                    ./home/waltz/extra-software.nix

                    # Load hardware config
                    inputs.nixos-hardware.nixosModules.lenovo-ideapad-s145-15api
                
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                 
                        # Import waltz's config
                        home-manager.users.waltz = import ./home/waltz/home.nix;

                        # Pass flakes to home-manager files
                        home-manager.extraSpecialArgs = {inherit inputs;};
                    }
                ];
            };
        };
    };
}
