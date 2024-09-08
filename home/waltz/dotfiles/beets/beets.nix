{ ... }:
{
  programs.beets = {
    enable = true;
    settings = {
      directory = "/home/waltz/music";
      import = { copy = "yes"; };
    };
  };
}
