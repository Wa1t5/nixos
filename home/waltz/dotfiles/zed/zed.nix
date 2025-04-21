{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "c"
      "nix"
      "dart"
      "catppuccin-blur"
    ];
    userSettings = {
      theme = lib.mkIf config.themes.catppuccin.enable {
        dark = lib.mkForce "Catppuccin Mocha (Blur)";
        light = lib.mkForce "Catppuccin Mocha (Blur)";
      };
      lsp = {
        nixd = {
          binary = {
            path = lib.getExe pkgs.nixd;
          };
        };
        nil = {
          binary = {
            path = lib.getExe pkgs.nil;
          };
          initialization_options = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
        dart = {
          binary = {
            path = lib.getExe pkgs.dart;
          };
          arguments = [ "language-server" ];
        };
      };
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };
    };
  };
}
