{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixpkgs-fmt # Nix code formatter
    nixfmt
  ];
}
