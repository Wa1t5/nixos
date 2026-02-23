{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    git-credential-manager
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "waltz";
        email = "79410846+Wa1t5@users.noreply.github.com";
      };
      credential = {
        helper = "manager";
        credentialStore = "cache";
      };
    };
  };
}
