{ ... }:
{
  # tofi config
  home.file."tofi" = {
    source = ./dotfiles/tofi/config;
    target = ".config/tofi/config";
    recursive = false;
  };

  # yazi config
  home.file."yazi" = {
    source = ./dotfiles/yazi/yazi.toml;
    target = ".config/yazi/yazi.toml";
    recursive = false;
  };
 
}
