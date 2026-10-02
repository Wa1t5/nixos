{
  description = "General Waltz Config";

  inputs = {
    nixos-hardware = {
      url = "github:Wa1t5/nixos-hardware/master";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    catppuccin.url = "github:catppuccin/nix";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    umbriel.url = "github:noctalia-dev/umbriel";
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    copyparty.url = "github:9001/copyparty";
  };

  nixConfig = {
    # Extra caches
    extra-trusted-users = [ "waltz" ];
    extra-substituters = [
      "https://ezkea.cachix.org/"
      "https://nix-community.cachix.org/"
      "https://attic.xuyh0120.win/lantian/"
      "https://noctalia.cachix.org"
    ];
    extra-trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        # Zooltrak Host
        "zoltraak" = nixpkgs.lib.nixosSystem {

          # System type
          system = "x86_64-linux";

          # Pass inputs as special args
          specialArgs = { inherit inputs; };

          # Modules
          modules = [
            # Import sops-nix
            inputs.sops-nix.nixosModules.sops

            # Import config.nix
            ./hosts/zoltraak/configuration.nix

            # Softwares that need to be defined in
            # configuration.nix but I removed
            # for modularity
            ./home/waltz/extra-software.nix

            # Load hardware config
            inputs.nixos-hardware.nixosModules.lenovo-ideapad-s145-15api

            inputs.home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [
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

        # Grimoire Host
        "grimoire" = nixpkgs.lib.nixosSystem {

          # System type
          system = "x86_64-linux";

          # Pass inputs as special args
          specialArgs = { inherit inputs; };

          # Modules
          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {

                  #slskd = inputs.slskdn.packages.${final.system}.default;
                })
              ];
            }
            # Import sops-nix
            inputs.sops-nix.nixosModules.sops
            inputs.copyparty.nixosModules.default

            # Import config.nix
            ./hosts/grimoire/configuration.nix

            # Softwares that need to be defined in
            # configuration.nix but I removed
            # for modularity
            ./home/waltz/extra-software.nix

            inputs.home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [
              ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bkp";

              wm.enable = false;
              headless.enable = true;
              gaming.enable = false;
              themes.catppuccin.enable = false;
              themes.stylix.enable = false;

              environment.pathsToLink = [
                "/share/applications"
                "/share/xdg-desktop-portal"
              ];

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
