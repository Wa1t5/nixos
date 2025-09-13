{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    dotnet-sdk_9
    mono
  ];

  programs.vscode = {
    enable = true;

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
