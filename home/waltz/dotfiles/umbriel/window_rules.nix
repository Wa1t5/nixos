{ ... }: {
  programs.umbriel.settings = {
    window_rule = [
      {
        blur = true;
        blur_optimized = true;
        tearing = true;
      }
      {
        match.app_id = "^dev.noctalia.Noctalia$";
        default_floating = true;
        default_floating_size_px = {
          width = 1020;
          height = 900;
        };
      }
    ];
  };
}
