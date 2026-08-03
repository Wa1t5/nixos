{ pkgs, ... }:
{
  programs.ncmpcpp = {
    enable = true;
    package = (pkgs.ncmpcpp.override { visualizerSupport = true; clockSupport = true; });
    settings = import ./osConfig.nix;
  };


}
