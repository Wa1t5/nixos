{
  description = "General Waltz Config";

    inputs = {
        # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-stable.url = "github:NixOS/nixpkgs/23.11";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, 
                nixpkgs, 
                nixos-hardware,
                home-manager, 
                hyprland,
                ... }: {
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
                nixos-hardware.nixosModules.lenovo-ideapad-s145-15api
                
                # Home manager
                home-manager.nixosModules.home-manager 
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                   
                    # Import waltz's config
                    home-manager.users.waltz = import ./home/waltz/home.nix;
                }
            ];
         };
    };
  };
}
