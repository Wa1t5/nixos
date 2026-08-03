{ ... }:
{
  # Apply steam_dev.cfg | it has a flag that forces shader compilation to use 8 cpu threads
  home.file."steam_dev.cfg" = {
    source = ./dotfiles/steam/steam_dev.cfg;
    target = ".local/share/steam";
  };

  # wireplumber
  home.file."wireplumber" = {
    source = ./dotfiles/wireplumber;
    target = ".config/wireplumber";
    recursive = true;
  };
}
