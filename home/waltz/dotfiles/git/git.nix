{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "waltz";
    userEmail = "79410846+Wa1t5@users.noreply.github.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = ''* '' + "~/.ssh/git_id_ecdsa.pub";
      user.signingkey = "~/.ssh/git_id_ecdsa.pub";
    };
  };
}
