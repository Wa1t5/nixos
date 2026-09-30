{ ... }: {
  programs.umbriel.settings = {
    appearance = {
      prefer_no_csd = true;
      border_width = 2;
      corner_radius = 10;
      blur = {
        enabled = true;
        optimized = true;
        passes = 3;
        radius = 3;
        noise = 0.02;
        brightness = 0.9;
        contrast = 0.9;
        saturation = 1.1;
      };
    };
  };
}
