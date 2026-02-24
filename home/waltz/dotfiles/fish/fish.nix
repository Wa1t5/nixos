{ ... }:
{
  programs.fish = {
    enable = false;

    shellAliases = {
      ripgrep = "rg";
      ls = "lsd";
      cat = "bat";
      df = "dysk";
      diff = "delta";
      du = "dust";
      find = "fd";
    };
  };
}
