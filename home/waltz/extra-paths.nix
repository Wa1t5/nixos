{ ... }:
{
  # wireplumber
  home.file."wireplumber" = {
    source = ./dotfiles/wireplumber;
    target = ".config/wireplumber";
    recursive = true;
  };
}
