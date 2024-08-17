{ ... }:
{
  programs.yazi = {
    enable = true;

    settings = {
      opener = {
        open = [
          { run = "xdg-open \"$1\""; desc = "Open"; for = "linux"; }
          { run = "open \"$@\""; desc = "Open"; for = "macos"; }
          { run = "start \" \" \"%1\""; orphan = true; desc = "Open"; for = "windows"; }
          { run = "/etc/nixos/home/waltz/dotfiles/hyprland/scripts/set_wallpaper.sh \"$@\""; orphan = true; desc = "Set wallpaper"; for = "linux"; }
          { run = "/etc/nixos/home/waltz/dotfiles/hyprland/scripts/change_pfp.sh \"$@\""; orphan = true; desc = "Change lockscreen image"; for = "linux"; }
        ];
      };
    };
  };
}
