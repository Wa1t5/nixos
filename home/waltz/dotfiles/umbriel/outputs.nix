{ ... }:
{
  programs.umbriel = {
    settings = {
      output."LG Electronics LG ULTRAGEAR 0x0005B599" = {
        mode = "1920x1080@120";
        position = [
          0
          0
        ];
        vrr = "disabled";
        direct_scanout = true;
        tearing = true;
        workspaces = 10;
      };

      output."BOE 0x0757 Unknown" = {
        enabled = true;
      };
    };
  };
}
