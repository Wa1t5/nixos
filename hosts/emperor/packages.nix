{ pkgs, ... }:
{
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    greetd.greetd
    greetd.tuigreet
  ];

  # TODO: Remove this as soon as maintainers update
  # their packages electron version
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  # Enable zsh shell
  programs.zsh.enable = true;

  # Virt
  virtualisation = {
    # Podman
    podman = {
      enable = true;
    };
  }; 
}
