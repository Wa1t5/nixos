{ inputs, pkgs, ... }:
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

      clipboard.register = "unnamedplus";
      clipboard.providers.wl-copy.enable = true;

      plugins = {

       # Side tree
        nvim-tree = {
          enable = true;
          openOnSetup = false;
          openOnSetupFile = false;
        };

        # Highlighter
        treesitter = {
	  enable = true;
	  nixGrammars = true;
	  folding = false;
	  indent = true;

	  ensureInstalled = [ "c" "nix" "norg" "rust" "zig" ];
	  #parserInstallDir = "~/.treesitter";
	};

        # Lsp Server
        lsp = { 
          enable = true;

          # Servers
          servers = {
            clangd.enable = true;
	    bashls.enable = true;
            nixd.enable = true;
          };
        };
        lsp-format.enable = false;
        lsp-lines.enable = true;
        lint.enable = true;

	# Formating
	conform-nvim.enable = true;

	# Error listing
	trouble.enable = true;

        # COQ Completion
        coq-nvim = {
          enable = true;
          installArtifacts = true;
          autoStart = true;
        };
        coq-thirdparty.enable = true;

        # Line
        lualine.enable = true; # Bottom
        #bufferline.enable = true; # Bars
        

	# Telescope
	#telescope = {
	#  enable = true;
	#  extensions = {
	#    file_browser.enable = true;
	#  };
	#};

	# Code context
	# navic.enable = true;
	# navbuddy.enable = true;

	# Which keys
	#which-key.enable = true;

	# Autopairs
	nvim-autopairs.enable = true;

        # Git
        gitsigns.enable = true;

        # Discord autocomplete
        presence-nvim.enable = true;


	# Neorg mode
        neorg = {
	  enable = false;
	  lazyLoading = true;
	  package = pkgs.vimPlugins.neorg;
	  modules = {
	    "core.defaults" = {
	      __empty = null;
	    };
	    "core.conceals" = {};
	    "core.dirman" = {
	      config = {
	        workspaces = {
	          notes = "~/docs/notes";
	        };
		default_workspace = "notes";
	      };
	    };
	  };
	};
      };

      # Colorscheme
      colorschemes.tokyonight.enable = true;

      # Options
      options = {
        # Show line number
        number = true;

	# Show number relative to position
	relativenumber = true;

        # Tab width
        shiftwidth = 2;
      };

      # Globals
      globals = {
      	mapleader = "space";
      };
  };
}
