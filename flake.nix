{
  description = "General Waltz Config";

  inputs = {
    nixos-hardware = {
      url = "github:Wa1t5/nixos-hardware/master";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-aseprite-fix = {
      url = "github:NixOS/nixpkgs/7b10b7951c1a7621289a9bae2e2a09368d7b99e3";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:HyprWM/Hyprland";
    Hyprspace = {
      url = "github:myamusashi/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    vicinae.url = "github:vicinaehq/vicinae";
    walker.url = "github:abenz1267/walker";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    hermes-agent.url = "github:NousResearch/hermes-agent";
  };

  nixConfig = {
    # Extra caches
    extra-trusted-users = [ "waltz" ];
    extra-substituters = [
      "https://ezkea.cachix.org/"
      "https://nix-community.cachix.org/"
      "https://hyprland.cachix.org/"
      "https://attic.xuyh0120.win/lantian/"
      #  "https://cache.garnix.io/"
    ];
    extra-trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      #  "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
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
                inputs.nix-cachyos-kernel.overlays.pinned
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

        # Grimoire Host
        "grimoire" = nixpkgs.lib.nixosSystem {

          # System type
          system = "x86_64-linux";

          # Pass inputs as special args
          specialArgs = { inherit inputs; };

          # Modules
          modules = [
            # Import sops-nix
            inputs.sops-nix.nixosModules.sops


            # Import config.nix
            ./hosts/grimoire/configuration.nix

            # Softwares that need to be defined in
            # configuration.nix but I removed
            # for modularity
            ./home/waltz/extra-software.nix

            inputs.home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [
                inputs.nix-cachyos-kernel.overlays.pinned
                #inputs.moonlight.overlays.default
                #inputs.emacs-overlay.overlays.default
              ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bkp";

              wm.enable = false;
              headless.enable = true;
              wm.hyprland.enable = false;
              gaming.enable = false;
              themes.catppuccin.enable = false;
              themes.stylix.enable = false;
              de.gnome.enable = false;
              de.plasma.enable = false;

              environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

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
