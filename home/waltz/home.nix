{ pkgs, inputs, ... }:
{            
        # Set usrename and home dir
        home.username = "waltz";
        home.homeDirectory = "/home/waltz";

        imports = [
            # Extra paths to add to home
            ./extra-paths.nix  

            # Specify xdg paths
            ./xdg-paths.nix    

            # import spicetify
            inputs.spicetify-nix.homeManagerModule            
        ];
        
        ########## Deploy extra files to home ##########     


        ########## Packages ##########
        home.packages = with pkgs; [
            # Text editing / Coding
            obsidian
            helix
            godot_4
            nil # Nix language server

            # Virtualisation
            distrobox

            # Terminal
            kitty
            direnv
           
            # CLI
            aichat
            btop
            fastfetch
            yazi
            imagemagick

            # CLI (GNU tools replacement)            
            lsd
            bat
            dysk
            delta
            du-dust
            fd

            # Torrent
            qbittorrent
        
            # Media
            playerctl

            # Browser
            librewolf

            # Chat
            vesktop 

            # Security
            keepassxc
            gnupg

            # Sync
            syncthing

            # XDG tools
            libnotify
            xdg-utils
            xdg-desktop-portal-hyprland
            
            # Provide some DE functionalities
            brightnessctl
            tofi
            wl-clipboard
            slurp
            grim
            waybar
            swww
            
            # Manage audio
            helvum
            pavucontrol

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
            '' + import ./dotfiles/hyprland/config.nix;
        };

        # Dconf (for easyeffects)
        dconf = {
            enable = true;  
        };
           
        programs = {

            # Eww
            eww = {
                enable = true;
                package = pkgs.eww-wayland;
                configDir = ./dotfiles/eww;
            };
            
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
                style = import ./dotfiles/waybar/style.nix;
                settings = import ./dotfiles/waybar/config.nix;
                systemd = {
                    enable = true;
                    target = "hyprland-session.target";
                };
            };

            # Kitty
            kitty = {
                enable = true;
                extraConfig = import ./dotfiles/kitty/config.nix;
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
                settings = import ./dotfiles/librewolf/config.nix;  
            };

            # Ncmpcpp
            ncmpcpp = {
                enable = true;
                package = (pkgs.ncmpcpp.override { visualizerSupport = true; clockSupport = true; });
                settings = import ./dotfiles/ncmpcpp/config.nix;
            };
            
            # Spicetify
            spicetify = {
                enable = true;
                enabledExtensions = with inputs.spicetify-nix.packages."x86_64-linux".default.extensions; [
                    fullAppDisplay
                    shuffle # shuffle+ (special characters are sanitized out of ext names)
                    adblock                    
                    popupLyrics
                ];
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
                    # Load p10k config
                    source ~/.p10k.zsh

                    # Allow direnv
                    eval "$(direnv hook zsh)"

                    # Aliases
                    alias ls="lsd"
                    alias cat="bat"
                    alias df="dysk"
                    alias diff="delta"
                    alias du="dust"
                    alias find="fd"
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
                    { event = "lock"; command = "/etc/nixos/home/waltz/dotfiles/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                    { event = "after-resume"; command = "/etc/nixos/home/waltz/dotfiles/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                    { event = "before-sleep"; command = "/etc/nixos/home/waltz/dotfiles/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
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
                extraConfig = import ./dotfiles/mpd/config.nix;
            };

            # Mpd mpris
            mpd-mpris = {
                enable = true;
            };

            # Playerctld
            playerctld = {
                enable = true;
            };
        };

        home.stateVersion = "24.05";
}
