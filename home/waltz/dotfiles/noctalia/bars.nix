{ ... }: {
  programs.noctalia.settings = {
    bar."default" = {
      padding = 0;
      margin_ends = 0;
      start = [ "workspaces" ];
      center = [
        "clock"
        #        "audio_visualizer"
      ];
      end = [
        "tray"
        "media"
        "notifications"
        "clipboard"
        "network"
        "bluetooth"
        "volume"
        "privacy"
      ];
    };
  };
}
