{ config, services, pkgs, ... }:

{
    home.username = "waltz";
    home.homeDirectory = "/home/waltz";

    home.packages = with pkgs; [
        # Hyprland
        xdg-desktop-portal-hyprland
        #hyprland
        hyprpaper

        # Shell
        zsh
                
        # CLI
        helix
        kitty
        eza
        btop
        fastfetch
        # ncmpcpp
        moc
        termusic
        
        # Servers
        # mpd
        
        # Media
        librewolf
        vesktop

        # Security
        keepassxc
        gnupg

        # Sync
        syncthing

        # Componnents
        libnotify
        light
        mako
        tofi
        wl-clipboard
        slurp
        waybar

        # Fonts
        noto-fonts
        noto-fonts-emoji
        noto-fonts-extra
        noto-fonts-cjk
        font-awesome
        (nerdfonts.override { fonts = [ "Noto" ]; })
    ];

    # Enable wayland for electron ozone apps
    home.sessionVariables = { NIXOS_OZONE_WL = "1"; };
    
    # Hyprland
    wayland.windowManager.hyprland = {
        systemd.enable = true;
        enable = true;
        xwayland.enable = false;
        extraConfig = import ./hyprland/config.nix;
    };


    programs = {
    
        # Git
        git = {
            enable = true;
            userName = "waltz";
            userEmail = "79410846+Wa1t5@users.noreply.github.com";
        };
        
        # Waybar
        waybar = {
            enable = true;
            style = import ./waybar/style.nix;
            settings = import ./waybar/config.nix;
            systemd = {
                enable = true;
                target = "hyprland-session.target";
            };
        };

        # Kitty
        kitty = {
            enable = true;
            extraConfig = import ./kitty/config.nix;
        };

        # Librewolf
        librewolf = {
            enable = true;
            settings = import ./librewolf/config.nix;  
        };

        # Ncmpcpp
        # ncmpcpp = {
        #     enable = true;
        # };

        # ZSH 
        zsh = {
            enable = true;
            
            plugins = [
               {
                   name = "powerlevel10k";
                   src = pkgs.zsh-powerlevel10k;
                   file = "/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
               }
               #{
               #    name = "zsh-completions";
               #    src = pkgs.zsh-completions;
               #}
            ];
            oh-my-zsh = {
                enable = true;
            };
            initExtra = ''
                source .p10k.zsh
            '';
       };
    
        # GPG
        gpg = {
            enable = true;
        };
    };
    
    services = {
        # Syncthing
        syncthing = {
            enable = true;
        };

        # Mako
        mako = {
            enable = true;
            extraConfig = import ./mako/config.nix;
        };

        # GPG Agent
        gpg-agent = {
            enable = true;
            enableSshSupport = true;
            pinentryFlavor = "gtk2";
            enableZshIntegration = true;
        };
 
        # Mpd
        #mpd = {
        #    enable = true;
        #    musicDirectory = "~/music";
        #    network = { startWhenNeeded = true; };
        #    extraConfig = ''
        #        audio_output {
        #        type "pipewire"
        #        name "My PipeWire Output"
        #    }'';
        #};
    };

    home.stateVersion = "23.05";
}
