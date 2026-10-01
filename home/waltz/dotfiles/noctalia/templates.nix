{ ... }: {
  programs.noctalia.settings = {
    theme.templates = {
      builtin_ids = [
        "qt"
        "kcolorscheme"
        "kitty"
        "umbriel"
      ];
      community_ids = [
        "obsidian"
        "zen-browser"
        "fcitx5"
        "neovim"
        "obs"
        "fastfetch"
        "steam"
        "prismlauncher"
      ];
    };
  };
}
