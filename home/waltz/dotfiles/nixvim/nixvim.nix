{ inputs, lib, config, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  # Neovim
  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  # Nixvim
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.catppuccin.enable = true;
    clipboard.register = "unnamedplus";

    plugins = {
      mini = {
        enable = true;
        modules.icons.enable = true;
        mockDevIcons = true;
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls = { enable = true; settings.formatting.command = [ "nixpkgs-fmt" ]; };
          clangd.enable = true;
          cmake.enable = true;
          dartls.enable = true;
        };
      };
      lsp-format = {
        enable = true;
        settings = { "nil-ls".sync = true; };
      };
      lsp-status.enable = true;
      lsp-lines.enable = true;

      #cmp-nvim-lsp.enable = true;
      #cmp-buffer.enable = true;
      #cmp-async-path.enable = true;
      #cmp-treesitter.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "treesitter"; }
        ];
      };

      treesitter = {
        enable = true;
        autoLoad = true;
        settings = {
          ensure_installed = [ "norg" ];
          auto_install = true;
          highlight.enable = true;
          indent.enable = true;
        };
      };
      treesitter-context.enable = true;
      treesitter-refactor.enable = true;
      treesitter-textobjects.enable = true;

      neo-tree.enable = true;

      bufferline.enable = true;

      direnv.enable = true;

      lualine.enable = true;
    };

    # Options
    opts = {
      # Show line number
      number = true;

      # Show number relative to position
      relativenumber = true;

      # Tab width
      shiftwidth = 2;
    };
  };
}
