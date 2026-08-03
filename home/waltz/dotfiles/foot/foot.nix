{ lib, osConfig, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    #settings = {
    #  main = {
    #	dpi-aware = true;
    #	font = "NotoSansMNerdFont:size=11";
    #  };
    #  colors = {
    #    alpha = 0.5;
    #  };
    #};
  };
}
