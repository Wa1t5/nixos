{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  # Nixvim
  programs.nixvim = {
      enable = true;

      defaultEditor = true;

      clipboard.providers.wl-copy.enable = true;
      
      plugins = {
        # Side tree
        nvim-tree = {
          enable = true;
          openOnSetup = true;
          openOnSetupFile = false;
        };

        # Highlighter
        treesitter.enable = true;

        # Lsp Server
        lsp = { 
          enable = true;

          # Servers
          servers = {
            clangd.enable = true;
            nixd.enable = true;
          };
        };
        lsp-format.enable = false;
        lsp-lines.enable = true;
        lint.enable = true;

        # COQ Completion
        coq-nvim = {
          enable = true;
          installArtifacts = true;
          autoStart = true;
        };
        coq-thirdparty.enable = true;

        # Line
        lualine.enable = true; # Bottom
        bufferline.enable = true; # Bars

	# indentation
	indent-blankline.enable = true;
        
        # Org mode
        neorg.enable = true;

	# Telescope
	telescope = {
	  enable = true;
	  extensions = {
	    file_browser.enable = true;
	  };
	};

	# Code context
	# navic.enable = true;
	# navbuddy.enable = true;

	# Which keys
	which-key.enable = true;

	# Autopairs
	nvim-autopairs.enable = true;

        # Git
        gitsigns.enable = true;

        # Discord autocomplete
        presence-nvim.enable = true;
      };

      # Colorscheme
      colorschemes.tokyonight.enable = true;

      # Options
      options = {
        # Show line number
        number = true;

        # Tab width
        shiftwidth = 2;
      };

      # Globals
      #globals = {
      #	mapleader = "space";
      #};

      # Keymaps
      keymaps = [
	{
	  mode = "n";
	  key = "<leader>fs";
	  action = "<cmd>Telescope file_browser";
	}
      ];
  };
}
