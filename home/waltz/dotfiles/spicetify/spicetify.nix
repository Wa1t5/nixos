{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.defaultDynamic;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      groupSession
      powerBar
      songStats
      beautifulLyrics
      copyLyrics
      volumePercentage
      betterGenres
      showQueueDuration
      featureShuffle
    ];
  };
}
