{ pkgs, lib, ... }: {
  programs.vscode = {
    enable = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions;
        [
          #ms-dotnettools.csharp
          #ms-dotnettools.vscode-dotnet-runtime
        ];

      userSettings = {
	System.Globalization.Invariant = true;
      #  dotnet.server.useOmnisharp = true;
      #  omnisharp.enableLspDriver = true;
      #omnisharp.enableAsyncCompletion = true;
      #omnisharp.dotnetPath = lib.getExe pkgs.dotnet-sdk_9;
      #omnisharp.sdkPath = lib.getExe pkgs.dotnet-sdk_9;
      #  dotnet.server.path = lib.getExe pkgs.omnisharp-roslyn;
      };
    };
  };
}
