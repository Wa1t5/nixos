{ ... }:
{
  programs.fish = {
    enable = true;

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
