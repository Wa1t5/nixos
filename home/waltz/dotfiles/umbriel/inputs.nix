{ ... }: {
  programs.umbriel.settings = {
    input = {
      middle_click_paste = false;

      keyboard = {
        layout = "us";
        variant = "intl";
      };

      mouse = {
        natural_scroll = false;
      };

      focus = {
        follows_mouse = true;
      };
    };
  };
}
