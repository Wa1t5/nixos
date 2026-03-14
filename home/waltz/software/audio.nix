{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Manage audio
    pavucontrol
  ];
}
