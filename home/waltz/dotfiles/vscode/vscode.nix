{ pkgs, lib, osConfig, ... }:
{

  programs.vscode = {
    enable = lib.mkIf (!osConfig.headless.enable) true;
    profiles = {
      "unity" = {
        extensions = with pkgs.vscode-extensions; [
          ms-dotnettools.csharp
          ms-dotnettools.vscode-dotnet-runtime
          ms-dotnettools.csdevkit
          visualstudiotoolsforunity.vstuc
        ];
      };
    };
  };
}
