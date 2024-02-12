{ inputs, ... }:
{
  programs.spicetify = {
    enable = false;
    enabledExtensions = with inputs.spicetify-nix.packages."x86_64-linux".default.extensions; [
                    fullAppDisplay
                    shuffle # shuffle+ (special characters are sanitized out of ext names)
                    adblock                    
                    popupLyrics
                ];

  };
}
