{
  description = "General Waltz Config";

    inputs = {
        # Nix Hardware
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";

        # Nix pkgs
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        # Home Manager
        home-manager = {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        # Stylix
        stylix.url = "github:danth/stylix";
        
        # Hyprland
        hyprland.url = "github:hyprwm/Hyprland";

        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };

        hyprland-plugins-hyprgrass = {
            url = "github:horriblename/hyprgrass";
            inputs.hyprland.follows = "hyprland";
        };

        # Spicetify
        spicetify-nix.url = "github:the-argus/spicetify-nix";

	# Nixvim
        nixvim.url = "github:nix-community/nixvim";

	# Lanzabooter (Secure boot)
	lanzaboote.url = "github:nix-community/lanzaboote";

	# Bleeding edges packages in general
  	# and custom kernel
        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
   };



    outputs = { nixpkgs, ... } @inputs: {
      nixConfig = {
        extra-trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
	  "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
	  "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
	];
	extra-substituters = [
	  "https://cache.nixos.org"
	  "https://hyprland.cachix.org"
	  "https://nyx.chaotic.cx"
       ];
      };

        nixosConfigurations = {
            # Emperor Host
            "emperor" = nixpkgs.lib.nixosSystem {

		# System type
                system = "x86_64-linux";

		# Pass inputs as special args
		specialArgs = { inherit inputs; };

		
		# Modules
                modules = [ 
		    # Chaotic module
		    inputs.chaotic.nixosModules.default

                    # Import config.nix
		    ./hosts/emperor/configuration.nix
        
                    # Softwares that need to be defined in
                    # configuration.nix but I removed
                    # for modularity
                    ./home/waltz/extra-software.nix

                    # Load hardware config
                    inputs.nixos-hardware.nixosModules.lenovo-ideapad-s145-15api

		    # Load lanazboote (secure boot)
		    inputs.lanzaboote.nixosModules.lanzaboote
                
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
