{ pkgs, ... }:
{
    #fonts.packages = with pkgs [
    #   nerdfonts.noto
    #   nerdfonts.jetbrains-mono
    #];
    fonts.fontconfig = {
        enable = true;
    };
}
