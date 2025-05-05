{ pkgs, inputs, ... }: {
  imports = [
    ../dotfiles/spicetify/spicetify.nix

  ];

  home.packages = with pkgs; [
    # Browser
    inputs.zen-browser.packages."${pkgs.system}".default

    # Music
    nicotine-plus

  ];
}
