{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      # Virtualisation
      gnome-boxes
    ];
}
