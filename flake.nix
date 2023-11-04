{
  description = "General Waltz Config";

  inputs = {
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/23.05";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    #impermanence = {
    #    url = "github:nix-community/impermanence";
    #    inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = {   self, 
                nixpkgs, 
                home-manager, 
                hyprland, 
                #impermanence,
                ... }: {
    nixosConfigurations = {

        # Emperor Host
        "emperor" = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ 
                # Import config.nix
                ./hosts/emperor/configuration.nix
                               
                # Home manager
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                
                    # Import waltzs config
                    home-manager.users.waltz = import ./home/waltz/home.nix;
                }
            ];
         };
    };
  };
}
