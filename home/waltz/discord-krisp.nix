{ config, pkgs, lib, ... }:
# File taken from: https://github.com/NixOS/nixpkgs/issues/195512#issuecomment-1814318443

let
  cfg = config.programs.discord;

discord = (pkgs.discord.override { withVencord = true; withOpenASAR = true; });    
discordPatcherBin = pkgs.writers.writePython3Bin "discord-krisp-patcher" {
    libraries = with pkgs.python3Packages; [ pyelftools capstone ];
    flakeIgnore = [
      "E265" # from nix-shell shebang
      "E501" # line too long (82 > 79 characters)
      "F403" # ‘from module import *’ used; unable to detect undefined names
      "F405" # name may be undefined, or defined from star imports: module
      "W391" # smth related to end of file
    ];
  } (builtins.readFile ./discord-patcher.py);

  wrapDiscordBinary = pkgs.writeShellScriptBin "discord" ''
    ${pkgs.findutils}/bin/find -L $HOME/.config/discord -name 'discord_krisp.node' -exec ${discordPatcherBin}/bin/discord-krisp-patcher {} +
    ${discord}/bin/discord "$@"
  '';
in {
  options.programs.discord = {
    enable = lib.mkEnableOption "Discord";
    wrapDiscord = lib.mkEnableOption "wrap the Discord binary with a patching each time";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ discordPatcherBin ]
                    ++ (if cfg.wrapDiscord
                        then [ wrapDiscordBinary ]
                        else [ discord ]
                    );

    # consideered adding a service here, that would patch discord using
    # a systemd service, but instead just opted to patch each time Discord starts
  };
}
