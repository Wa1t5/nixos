{ pkgs, ... }:
{
            programs.zsh = {
                enable = true;
                
                plugins = [
                    {
                       name = "powerlevel10k";
                       src = pkgs.zsh-powerlevel10k;
                       file = "/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
                    }
                ];
                oh-my-zsh = {
                    enable = true;
                };
                initExtra = ''
                    # Load p10k config
                    source ~/.p10k.zsh

                    # Allow direnv
                    eval "$(direnv hook zsh)"

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
