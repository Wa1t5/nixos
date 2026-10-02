{
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}:
{
  imports = [
    ../dotfiles/umbriel/umbriel.nix
    ../dotfiles/noctalia/noctalia.nix
    ../dotfiles/ime/ime.nix
    ../dotfiles/fontconfig/fontconfig.nix
    ../dotfiles/qt/qt.nix
  ];

  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
    ];
  };
}
