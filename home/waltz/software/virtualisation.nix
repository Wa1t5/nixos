{ pkgs, lib, osConfig, ... }: {

  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs;
      [
        # Virtualisation
        gnome-boxes
      ];
  };
}
