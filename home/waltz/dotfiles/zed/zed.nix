{ lib, osConfig, pkgs, ... }: {
  programs.zed-editor = {
    enable = false;

    extensions = [ "c" "csharp" "zig" "nix" "dart" "catppuccin-blur" ];
    userSettings = {
      theme = lib.mkIf osConfig.themes.catppuccin.enable {
        dark = lib.mkForce "Catppuccin Mocha (Blur)";
        light = lib.mkForce "Catppuccin Mocha (Blur)";
      };
      lsp = {
        nixd = { binary = { path = lib.getExe pkgs.nixd; }; };
        nil = {
          binary = { path = lib.getExe pkgs.nil; };
          initialization_options = {
            formatting = { command = [ "nixfmt" ]; };
          };
        };
        zls = {
          binary = {
            path = lib.getExe pkgs.zls;
          };
          initialization_options = {
            zig_exe_path = lib.getExe pkgs.zig;
          };
        };
        omnisharp = {
          binary = {
            path = lib.getExe pkgs.omnisharp-roslyn;
          };
        };
        dart = {
          binary = {
            path = lib.getExe pkgs.dart;
            arguments = [ "language-server" ];
          };
        };
        rust-analyzer = {
          binary = {
            path = lib.getExe pkgs.rust-analyzer;
          };
        };
      };
      features = { copilot = false; };
      telemetry = { metrics = false; };
    };
  };
}
