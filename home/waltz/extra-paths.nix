{ ... }:
{
  # yazi config
  #home.file."yazi" = {
  #  source = ./dotfiles/yazi/yazi.toml;
  #  target = ".config/yazi/yazi.toml";
  #  recursive = false;
  #};
  home.file."rofimoji.rc" = {
    source = ./dotfiles/rofi/rofimoji.rc;
    target = ".config/rofimoji.rc";
  };
}
