{
  description = "General Waltz Config";

  inputs = {
    # Nix Hardware
    nixos-hardware = { url = "github:Wa1t5/nixos-hardware/master"; };

    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plasma Manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Sops-nix
    sops-nix.url = "github:Mic92/sops-nix";

    # Catpuccin
    catppuccin.url = "github:catppuccin/nix";

    # Stylix
    stylix.url = "github:danth/stylix";

    # Spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim
    nixvim.url = "github:nix-community/nixvim";

    # An anime game launcher
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:HyprWM/Hyprland";

    # Hyprspace
    Hyprspace = {
      #url = "github:KZDKM/Hyprspace/33663be68a4b2f20e9c2f6a14f18cc1d8a60110f";
      url = "github:myamusashi/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    # Walker
    walker.url = "github:abenz1267/walker";
  };

  nixConfig = {
    # Extra caches
    extra-trusted-users = [ "waltz" ];
    extra-substituters = [
      "https://ezkea.cachix.org/"
      "https://nix-community.cachix.org/"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # Emperor Host
      "emperor" = nixpkgs.lib.nixosSystem {

        # System type
        system = "x86_64-linux";

        # Pass inputs as special args
        specialArgs = { inherit inputs; };

        # Modules
        modules = [
          # Import sops-nix
          inputs.sops-nix.nixosModules.sops

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
            nixpkgs.overlays = [
              #inputs.moonlight.overlays.default
              #inputs.emacs-overlay.overlays.default
            ];

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bkp";

            # Import waltz's config
            home-manager.users.waltz = import ./home/waltz/home.nix;

            # Pass flakes to home-manager files
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
