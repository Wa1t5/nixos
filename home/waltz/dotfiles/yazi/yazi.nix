{ ... }:
{
  programs.yazi = {
    enable = true;
  };

  # yazi config
  home.file."yazi" = {
    source = ./yazi.toml;
    target = ".config/yazi/yazi.toml";
    recursive = false;
  };
}
