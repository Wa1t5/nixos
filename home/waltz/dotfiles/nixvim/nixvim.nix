{ inputs, lib, config, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  # Neovim
  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  # Nixvim
  programs.nixvim = {
    enable = true;

    defaultEditor = true;

    luaLoader.enable = false;

    colorschemes.catppuccin.enable = true;


    clipboard.register = lib.mkIf config.wm.enable "unnamedplus";
    clipboard.providers.wl-copy.enable = lib.mkIf config.wm.enable true;

    plugins = {
      mini = {
	enable = true;
	modules.icons = true;
      };
      lsp = {
        enable = true;
        servers = {
          nil-ls = { enable = true; settings.formatting.command = [ "nixpkgs-fmt" ]; };
          clangd.enable = true;
          cmake.enable = true;
          dartls.enable = true;
        };
      };
      lsp-format = {
        enable = true;
        setup = { "nil-ls".sync = true; };
      };
      lsp-status.enable = true;
      lsp-lines.enable = true;

      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-async-path.enable = true;
      cmp-treesitter.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "treesitter"; }
        ];
        settings.mappings = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };

      treesitter.enable = true;
      treesitter-context.enable = true;
      treesitter-refactor.enable = true;

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
