{ pkgs, lib, osConfig, ... }: {

  imports = [
    #../dotfiles/discord/discord.nix
  ];

  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
      # Chat
      vesktop
      (pkgs.discord.override {
        withVencord = true;
        withOpenASAR = false;
      })

    ];

  };
}
