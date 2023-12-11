{ ... }:
{
  # pywal templates
  home.file."wal" = {
    source = ./dotfiles/wal/templates;
    target = ".config/wal/templates";
    recursive = false;
  };

  # tofi config
  home.file."tofi" = {
    source = ./dotfiles/tofi/config;
    target = ".config/tofi/config";
    recursive = false;
  };
}
