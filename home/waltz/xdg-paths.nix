{ config, ... }:
{
  # Set xdg user dirs
  xdg.userDirs = {
    enable = true;
    documents = "${config.home.homeDirectory}/docs";
    music = "${config.home.homeDirectory}/music";
    videos = "${config.home.homeDirectory}/video";
    pictures = "${config.home.homeDirectory}/img";          
    download = "${config.home.homeDirectory}/downloads";
    desktop = "${config.home.homeDirectory}/desktop";
  }; 
 }
