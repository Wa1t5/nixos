# Emperor / Grimoire
My main NixOS config that I've been building and using for some years.

### Grimoire
Homelab config running on an Ideapad 310 14ISK headless, used for streaming media across my devices and my recursive dns stack blocky + unbound

### Emperor
Main config that runs on my Ideapad S145 15API (when I'm not using windows...). I mainly use hyprland on it but I also made it possible to change to kde and gnome on the fly

### Why this exists?
Well this is more of a daily driver + study project, I started it after I migrated from gentoo, originally I started in the linux world with mint, then I changed to arch, gentoo and now nixos, 
it's much easier for me to just plug the usb drive in a new host, pull this repository and just do a nix rebuild for me it's way faster and more convenient than having to recreate everything by hand,
yes it's also more convenient than just having a dotfiles repo (I used to have one before this).
So I thing this summarizes things, all my progress can be seen across the commits, there's one that I just hardcoded a wifi password on it... Because I didn't know about sops,
and along the years this evolved thinking on a multi-host setup even though I can't afford new hosts lol (future proofing I guess)

### Things that I remember that are here
Well since this has such a long history I can't remember everything but I'll try
* Sops secrets management
* Separation using flags
* doas instead of sudo
* Custom DNS chain (Blocky + Unbound, no systemd-resolved)
* Caddy reverse proxy with internal TLS for *.home domains
* systemd-networkd + iwd instead of NetworkManager
* Stylix + Catppuccin theming across the board
* Hyprland as the compositor, with custom wallpaper/pfp/colorscheme scripts
* Home-manager wired as a NixOS module, with osConfig passed through so home-manager modules can read system-level options
* Homelab stack: Jellyfin, Navidrome, Kavita, qBittorrent, slskd, Beets with a scheduled auto-import
* WireGuard tunnel dedicated to Soulseek traffic
* Gaming: Steam + Proton-GE + gamescope + MangoHud
* Custom DNS/ad-block chain (Blocky + Unbound, no systemd-resolved)
