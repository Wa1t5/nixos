{ config, services, pkgs, home-manager, ... }:
{
        # Set usrename and home dir
        home.username = "waltz";
        home.homeDirectory = "/home/waltz";

        # Packages
        home.packages = with pkgs; [
            # Hyprland
            xdg-desktop-portal-hyprland
            #hyprland
            hyprpaper

            # Shell
            zsh

            # Production
            #qownnote
            
            # CLI
            helix
            kitty
            eza
            btop
            #fastfetch # Remove fastfetch until they fix it
            ncmpcpp
                
            # Servers
            mpd
        
            # Media
            librewolf
            vesktop
            easyeffects

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
            grim
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

        # Set xdg user dirs
        xdg.userDirs = {
            enable = true;
            documents = "${config.home.homeDirectory}/docs";
            music = "${config.home.homeDirectory}/music";
            pictures = "${config.home.homeDirectory}/img";          
            download = "${config.home.homeDirectory}/downloads";
            desktop = "${config.home.homeDirectory}/desktop";
        }; 
         
        # Hyprland
        wayland.windowManager.hyprland = {
            systemd.enable = true;
            enable = true;
            xwayland.enable = false;
            extraConfig = '' 
                # Force electron apps to use wayland backend
                env = NIXOS_OZONE_WL,1
            '' + import ./hyprland/config.nix;
        };


        # Dconf (for easyeffects)
        dconf = {
            enable = true;  
        };

        programs = {    
            # Git
            git = {
                enable = true;
                userName = "waltz";
                userEmail = "79410846+Wa1t5@users.noreply.github.com";
                signing = {
                    key = "0x0EEB210433A61B10";
                };
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

            # Helix
            helix = {
                enable = true;
                defaultEditor = true;
                settings = {
                    theme = "dracula_at_night";
                };
            };

            # Librewolf
            librewolf = {
                enable = true;
                settings = import ./librewolf/config.nix;  
            };

            # Ncmpcpp
            ncmpcpp = {
                enable = true;
            };

            # ZSH 
            zsh = {
                enable = true;
                
                plugins = [
                    {
                       name = "powerlevel10k";
                       src = pkgs.zsh-powerlevel10k;
                       file = "/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
                    }
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
            mpd = {
                enable = true;
                network = { startWhenNeeded = true; };
                extraConfig = ''
                    audio_output {
                        type "pipewire"
                        name "Pipewire Output"
                    }'';
             };

            # Easyeffects
            easyeffects = {
                enable = true;
            };
        };

        home.stateVersion = "23.11";    
}
