{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    prezto = {
      enable = false;
      #extraConfig = "
      #	zstyle :prezto:module:prompt theme powerlevel10k
      # ";
    };

    initContent = ''
      source ./.p10k.zsh

      # Allow direnv
      eval "$(direnv hook zsh)"

      # Enable interactive menu for completions
      zstyle ':completion:*' menu select=0

      # Keybinds
      bindkey '^H' backward-kill-word

      # Aliases
      alias ls="lsd"
      alias cat="bat"
      alias df="dysk"
      alias diff="delta"
      alias du="dust"
      alias find="fd"
    '';
  };

}
