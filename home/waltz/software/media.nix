{ pkgs, inputs, lib, osConfig, ... }:
{
  imports = [
    ../dotfiles/spicetify/spicetify.nix

  ];
  config = lib.mkIf (!osConfig.headless.enable) {

    home.packages = with pkgs; [
      # Browser
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default

      # Music
      nicotine-plus

    ];
  };
}
