{ lib, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [ "c" "nix" "dart" ];
    userSettings = {
      lsp = {
        nixd = {
          binary = { path = lib.getExe pkgs.nixd; };
        };
        nil = {
          binary = { path = lib.getExe pkgs.nil; };
          initialization_options = {
            formatting = { command = [ "nixfmt" ]; };
          };
        };
        dart = {
          binary = { path = lib.getExe pkgs.dart; };
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
