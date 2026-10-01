{ ... }:
{
  # Apply steam_dev.cfg | it has a flag that forces shader compilation to use 8 cpu threads
  home.file."steam_dev.cfg" = {
    source = ./dotfiles/steam/steam_dev.cfg;
    target = ".steam/steam/steam_dev.cfg";
  };

  # Apply noctalia theme on qt apps
  home.file."qt6ct.conf" = {
    source = ./dotfiles/qt/qt6ct.conf;
    target = ".config/qt6ct/qt6ct.conf";
  };
}
