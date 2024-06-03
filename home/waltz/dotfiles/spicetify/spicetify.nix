{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.DefaultDynamic;
    enabledExtensions = with inputs.spicetify-nix.packages."x86_64-linux".default.extensions; [
                    fullAppDisplay
                    shuffle # shuffle+ (special characters are sanitized out of ext names)
                    adblock                    
                    popupLyrics
                ];

  };
}
