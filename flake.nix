{
  description = "Emperor(hostname) sysconfig";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
        url = "github:hyprwm/Hyprland";
    };
  };


  outputs = { self, 
              nixpkgs, 
              home-manager, 
              hyprland, 
              ... }: {
    nixosConfigurations = {
        "emperor" = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ 
                # Import config.nix
                ./configuration.nix 

                # Home manager
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    # Import waltz's config
                    home-manager.users.waltz = import ./home.nix;
                }
            ];
        };
    };
  };
}
