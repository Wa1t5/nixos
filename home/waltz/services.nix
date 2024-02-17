{ pkgs, ...}:
{  
        services = {
            # Swayidle
            swayidle = {
                enable = true;
                events = [
                    { event = "lock"; command = "/etc/nixos/home/waltz/dotfiles/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                    { event = "after-resume"; command = "/etc/nixos/home/waltz/dotfiles/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                    { event = "before-sleep"; command = "/etc/nixos/home/waltz/dotfiles/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
                ];

		timeouts = [
                    { timeout = 60 ; command = "/etc/nixos/home/waltz/dotfiles/swaylock/scripts/lock_screen.sh ${pkgs.swaylock-effects}/bin/swaylock"; }
		];
            };
            
            # Syncthing
            syncthing = {
                enable = true;
            };

            # Dunst
            dunst = {
                enable = true;
                settings = import ./dotfiles/dunst/dunst.nix;
            };

            # GPG Agent
            gpg-agent = {
                enable = true;
                enableSshSupport = true;
                pinentryFlavor = "tty";
                enableZshIntegration = true;
            };
 
            # Mpd
            mpd = {
                enable = true;
                network = { startWhenNeeded = true; };
                extraConfig = import ./dotfiles/mpd/config.nix;
                playlistDirectory = "/home/waltz/music/Playlists";
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
}
