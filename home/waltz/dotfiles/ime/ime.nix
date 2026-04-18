{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
      settings = {
        #inputMethod = {
        #  "Groups/0" = {
        #    Name = "Default";
        #    "Default Layout" = "us";
        #    DefaultIM = "mozc";
        #  };
        #  "Groups/0/Items/0".Name = "keyboard-us";
        #  "Groups/0/Items/1".Name = "mozc";
        #};
        #globalOptions = {
        #  Hotkey = {
        #    TriggerKeys = "0=Super+Space";
        #    EnumerateGroupForwardKeys = "0=Super+Space";
        #  };
        #};
      };
    };
  };

  #home.file.".config/fcitx5/" = {
  xdg.configFile."fcitx5?" = {
    source = ./fcitx5;
    force = true;
    recursive = true;
  };
}
