{
  description = "General Waltz Config";

  inputs = {
    # Nix Hardware
    nixos-hardware = {
      url = "github:Wa1t5/nixos-hardware/master";
    };

    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Sops-nix
    sops-nix.url = "github:Mic92/sops-nix";

    # Catpuccin
    catppuccin.url = "github:catppuccin/nix";

    # Stylix
    stylix.url = "github:danth/stylix";

    # Hyprland
    #hyprland = {
    #  url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #};

    hyprlock = {
      url = "git+https://github.com/hyprwm/Hyprlock?submodules=1";
    };

    hypridle = {
      url = "git+https://github.com/hyprwm/Hypridle?submodules=1";
    };

    xdpw = {
      url = "git+https://github.com/hyprwm/xdg-desktop-portal-hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim
    nixvim.url = "github:nix-community/nixvim/nixos-24.05";

    # Cosmic
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Walker
    walker.url = "github:abenz1267/walker";

    # An anime game launcher
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-24.05";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    # Extra caches
    extra-trusted-users = [ "waltz" ];
    extra-substituters = [
      "https://cosmic.cachix.org/"
      "https://hyprland.cachix.org/"
      "https://walker.cachix.org/"
      "https://walker-git.cachix.org/"
      "https://ezkea.cachix.org/"
    ];
    extra-trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];

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

