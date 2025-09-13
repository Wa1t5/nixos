{ pkgs, ... }:
{
  #programs.git-credential-oauth = {
  #  enable = true;
  #};
  home.packages = with pkgs; [
    git
    git-credential-manager
  ];

  programs.git = {
    enable = true;
    userName = "waltz";
    userEmail = "79410846+Wa1t5@users.noreply.github.com";
    extraConfig = {
      credential = {
	helper = "manager";
	credentialStore = "cache";
      };
    };
  };
}
