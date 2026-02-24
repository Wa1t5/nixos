{ inputs, pkgs, ... }:
{
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Stylix
  imports = [
    inputs.stylix.nixosModules.stylix
    ../../home/waltz/dotfiles/stylix/stylix.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    polkit_gnome
    greetd
    tuigreet

    # Bluetooth tui
    bluetui
  ];

  # TODO: Remove this when obsidian decides to update their old electron version
  #nixpkgs.config.permittedInsecurePackages = [
  #  "electron-25.9.0"
  #  "electron-24.8.6"
  #];

  # Enable zsh shell
  programs.zsh.enable = true;
  #programs.fish.enable = true;

  # Virt
  #virtualisation = {
  # Podman
  #  podman = {
  #    enable = true;
  #  };
  #};
}
