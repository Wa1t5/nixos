{ ... }:
{
  # wireplumber
  home.file."wireplumber" = {
    source = ./dotfiles/wireplumber;
    target = ".config/wireplumber";
    recursive = true;
  };

  # rofimoji
  home.file."rofimoji.rc" = {
    source = ./dotfiles/rofi/rofimoji.rc;
    target = ".config/rofimoji.rc";
  };
}
