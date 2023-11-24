{ config, services, pkgs, home-manager, ... }:
{            
        # Set usrename and home dir
        home.username = "waltz";
        home.homeDirectory = "/home/waltz";
       
        ########## Deploy extra files to home ##########     
        
            # pywal templates
            home.file."wal" = {
                source = ./wal/templates;
                target = ".config/wal/templates";
                recursive = false;
            };

            # tofi config
            home.file."tofi" = {
                source = ./tofi/config;
                target = ".config/tofi/config";
                recursive = false;
            };

        ########## Packages ##########
        home.packages = with pkgs; [
            # Hyprland
            xdg-desktop-portal-hyprland
            swww

            # Text editing / Coding
            obsidian
            helix

            # Virtualisation
            distrobox

            # Terminal
            kitty
            direnv
           
            # CLI
            eza
            btop
            fastfetch
            imagemagick
                
        
            # Media
            librewolf
            playerctl
            vesktop 
            easyeffects

            # Security
            keepassxc
            gnupg

            # Sync
            syncthing

            # Complements
            libnotify
            xdg-utils
            brightnessctl
            tofi
            wl-clipboard
            slurp
            grim
            waybar
            wpgtk

            # Fonts
            noto-fonts
            noto-fonts-emoji
            noto-fonts-extra
            noto-fonts-cjk
            font-awesome
            (nerdfonts.override { fonts = [ "Noto" ]; })
        ];

        # Enable wayland for electron ozone apps
        # home.sessionVariables = { NIXOS_OZONE_WL = "1"; };
        home.sessionVariables = { PATH = "/home/waltz/.local/bin:$PATH"; };

        # Set xdg user dirs
        xdg.userDirs = {
            enable = true;
            documents = "${config.home.homeDirectory}/docs";
            music = "${config.home.homeDirectory}/music";
            videos = "${config.home.homeDirectory}/video";
            pictures = "${config.home.homeDirectory}/img";          
            download = "${config.home.homeDirectory}/downloads";
            desktop = "${config.home.homeDirectory}/desktop";
        }; 
        
        # Hyprland
        wayland.windowManager.hyprland = {
            systemd.enable = true;
            enable = true;
            xwayland.enable = true;
            extraConfig = '' 
                # Force electron apps to use wayland backend
                # env = NIXOS_OZONE_WL,1

                # Add .local/bin to PATH
                env = PATH,/home/waltz/.local/bin:$PATH
            '' + import ./hyprland/config.nix;
        };

        # Dconf (for easyeffects)
        dconf = {
            enable = true;  
        };
        
        programs = {
            # Swaylock
            swaylock = {
                enable = true;
                package = pkgs.swaylock-effects;
            };
            
            # VSCode
            vscode = {
                enable = true;
                package = pkgs.vscode-fhs;
            };
             
            # Pywal
            pywal = {
                enable = true;
            };
          
            # Obs studio
            obs-studio = {
                enable = true;
                plugins = [
                    pkgs.obs-studio-plugins.obs-pipewire-audio-capture
                ];
            };
             
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
                package = (pkgs.ncmpcpp.override { visualizerSupport = true; clockSupport = true; });
                settings = { 
                    # Script to show song info
                    execute_on_song_change = "/etc/nixos/home/waltz/ncmpcpp/scripts/song_info.sh"; 

                    # Enable visualization
                    visualizer_data_source = "/tmp/mpd.fifo";
                    visualizer_output_name = "my_fifo";
                    visualizer_in_stereo = "yes";
                    visualizer_type = "spectrum";
               };
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
                    source ~/.p10k.zsh
                    eval "$(direnv hook zsh)"
                '';
           };
    
            # GPG
            gpg = {
                enable = true;
            };
        };


        ########## Services ##########
        services = {
            # Swayidle
            swayidle = {
                enable = true;
                events = [
                    { event = "lock"; command = "/etc/nixos/home/waltz/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                    { event = "after-resume"; command = "/etc/nixos/home/waltz/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                    { event = "before-sleep"; command = "/etc/nixos/home/waltz/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                ];
            };
            
            # Syncthing
            syncthing = {
                enable = true;
            };

            # Fnott
            fnott = {
                enable = true;
                configFile = "/home/waltz/.cache/wal/colors-fnott.ini";
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
                    # Audio output
                    audio_output {
                        type "pipewire"
                        name "Pipewire Output"
                    } 
                    
                    audio_output {
                        type "fifo"
                        name "my_fifo"
                        path "/tmp/mpd.fifo"
                        format "44100:16:2"
                    }
                '';
            };

            # Mpd mpris
            mpd-mpris = {
                enable = true;
            };

            # Playerctld
            playerctld = {
                enable = true;
            };

            # Easyeffects
            easyeffects = {
                enable = true;
            };
        };

        home.stateVersion = "23.11";
}
