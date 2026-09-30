{
  pkgs,
  lib,
  osConfig,
  ...
}:
{

  imports = [ ../dotfiles/zen-browser/zen-browser.nix ];

  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
      strawberry
    ];
  };
}
