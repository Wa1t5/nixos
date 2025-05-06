{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [ ms-dotnettools.csharp  ms-dotnettools.csdevkit ];
  };
}
