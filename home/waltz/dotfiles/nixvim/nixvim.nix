{ inputs
, lib
, osConfig
, ...
}:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  # Nixvim
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    clipboard.register = "unnamedplus";

    lsp = {
      servers = {
        nil_ls = {
          enable = true;
        };
      };
    };

    plugins = {
      vim-suda = {
        enable = true;
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_after_save = {
            lsp_format = "prefer";
          };
        };
      };

      lspconfig.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      wrap = false;
    };
  };
}
