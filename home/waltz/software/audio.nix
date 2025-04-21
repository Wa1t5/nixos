{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Manage audio
    helvum
    pavucontrol
  ];
}
