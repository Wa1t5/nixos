{
  description = "General Waltz Config";

    inputs = {
        # Nix Hardware
        #nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        nixos-hardware.url = "github:Wa1t5/nixos-hardware/master"; # use my branch until I merge my changes on master branch

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
        hyprland = {
          url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        };

        hyprlock = {
          url = "git+https://github.com/hyprwm/Hyprlock?submodules=1";
        };
        
        hypridle = {
          url = "git+https://github.com/hyprwm/Hypridle?submodules=1";
        };
        
        xdpw = {
          url = "git+https://github.com/hyprwm/xdg-desktop-portal-hyprland?submodules=1";
        };

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

	# Cosmic
    	nixos-cosmic = {
      	   url = "github:lilyinstarlight/nixos-cosmic";
    	};

   };

	nixConfig = {
            extra-substituters = [ "https://cosmic.cachix.org/" "https://hyprland.cachix.org/" ];
            extra-trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
        };


   outputs = { nixpkgs, ... } @inputs: {
        nixosConfigurations = {
            # Emperor Host
            "emperor" = nixpkgs.lib.nixosSystem {

		# System type
                system = "x86_64-linux";

		# Pass inputs as special args
		specialArgs = { inherit inputs; };
		
		# Modules
                modules = [ 
                    # Import config.nix
		    ./hosts/emperor/configuration.nix

        
                    # Softwares that need to be defined in
                    # configuration.nix but I removed
                    # for modularity
                    ./home/waltz/extra-software.nix

		    # Load cosmic
          	    nixos-cosmic.nixosModules.default

                    # Load hardware config
                    #inputs.nixos-hardware.nixosModules.lenovo-ideapad-s145-15api

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
