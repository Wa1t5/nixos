{ pkgs, ... }: {
  imports = [
    #../dotfiles/discord/discord.nix
  ];

  home.packages = with pkgs; [
    # Chat
    vesktop
    (pkgs.discord.override {
      withVencord = true;
      withOpenASAR = false;
    })

  ];
}
