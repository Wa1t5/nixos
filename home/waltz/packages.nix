{ inputs, pkgs, ... }:
{  
        home.packages = with pkgs; [
            # Text editing / Coding
            obsidian
            helix
            godot_4
            nil # Nix language server

            # Games
            osu-lazer-bin

            # Virtualisation
            distrobox

            # Terminal
            kitty
            direnv
           
            # CLI
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
            spotify

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
            #xdg-desktop-portal-hyprland
            #xwaylandvideobridge
            
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

        programs = {

            discord = {
                enable = true;
                wrapDiscord = true;
            };

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
             
            # Bemenu
            bemenu = {
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

            # Cava
            cava = {
                enable = true;
                settings = import ./dotfiles/cava/config.nix;
            };
            
            # Spicetify
            spicetify = {
                enable = false;
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


}
