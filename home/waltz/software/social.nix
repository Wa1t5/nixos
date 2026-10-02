{
  pkgs,
  lib,
  osConfig,
  ...
}:
{

  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
      # Chat
      (pkgs.discord.override {
        withVencord = true;
        withOpenASAR = false;
      })

    ];

  };
}
