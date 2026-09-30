{ lib, ... }:
{
  # Options
  options = {
    wm.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable WM mode";
    };

    headless.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
    };

    wm.umbriel.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable umbriel compositor";
    };

    themes.catppuccin.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable the catppuccin theme";
    };

    themes.stylix.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable the stylix dynamic theme";
    };

    gaming.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable steam and other gaming related options";
    };
  };
}
