{ ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "lsd";
      cat = "bat";
      df = "dysk";
      diff = "delta";
      du = "dust";
      find = "fd";
    };
  };
}
