{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Security
    keepassxc
    age
  ];
}
