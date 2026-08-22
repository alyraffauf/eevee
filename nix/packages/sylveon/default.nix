{
  inputs,
  lib,
  self,
  ...
}: let
  mkModuleOption = description:
    lib.mkOption {
      type = lib.types.deferredModule;
      default = {};
      inherit description;
    };
in {
  options.flake.neovimModules.sylveon = mkModuleOption "Sylveon AstroNvim configuration.";
  options.flake.neovimModules.default = mkModuleOption "Default Eevee Neovim module. An alias for sylveon.";

  config = {
    flake.neovimModules.sylveon = {...}: {
      imports = [
        self.neovimModules.base
        self.neovimModules.astronvim
        self.neovimModules.astrocommunity
        self.neovimModules.ai
        self.neovimModules.ansible
        self.neovimModules.build
        self.neovimModules.completion
        self.neovimModules.configLanguages
        self.neovimModules.core
        self.neovimModules.debugging
        self.neovimModules.formatting
        self.neovimModules.go
        self.neovimModules.git
        self.neovimModules.jvm
        self.neovimModules.lsp
        self.neovimModules.lua
        self.neovimModules.mason
        self.neovimModules.nix
        self.neovimModules.otherLanguages
        self.neovimModules.python
        self.neovimModules.ui
        self.neovimModules.resession
        self.neovimModules.rust
        self.neovimModules.shell
        self.neovimModules.terminal
        self.neovimModules.treesitter
        self.neovimModules.web
        self.neovimModules.plugins
        self.neovimModules.extraPackages
      ];

      vim = {
        viAlias = true;
        vimAlias = true;

        globals = {
          mapleader = " ";
          maplocalleader = ",";
        };

        opts = {
          number = true;
          relativenumber = false;
          expandtab = true;
          shiftwidth = 0;
          tabstop = 2;
        };

        luaConfigRC.sylveonClipboard = inputs.nvf.lib.nvim.dag.entryAnywhere ''
          vim.g.clipboard = "osc52"
        '';
      };

      eevee.lazyOptions = {
        install.colorscheme = ["astrotheme" "habamax"];
        ui.backdrop = 100;
        performance.rtp.disabled_plugins = ["gzip" "netrwPlugin" "tarPlugin" "tohtml" "zipPlugin"];
      };

      eevee.pluginOrder = [
        "AstroNvim"
        "astrocommunity"
        "astrocore"
        "astrolsp"
        "astroui"
        "astrotheme"
        "aerial.nvim"
        "ansible-vim"
        "better-escape.nvim"
        "blink.cmp"
        "blink.compat"
        "catppuccin"
        "chezmoi.nvim"
        "chezmoi.vim"
        "cmp-dap"
        "codecompanion.nvim"
        "crates.nvim"
        "friendly-snippets"
        "lazydev.nvim"
        "gitsigns.nvim"
        "gopher.nvim"
        "guess-indent.nvim"
        "heirline.nvim"
        "image.nvim"
        "mason.nvim"
        "mason-lspconfig.nvim"
        "mason-null-ls.nvim"
        "mason-nvim-dap.nvim"
        "mini.icons"
        "LuaSnip"
        "mini.map"
        "neo-tree.nvim"
        "nvim-treesitter"
        "nvim-treesitter-textobjects"
        "nvim-ts-autotag"
        "nvim-web-devicons"
        "nvim-autopairs"
        "nvim-dap"
        "nvim-dap-go"
        "nvim-dap-python"
        "nvim-dap-ui"
        "nvim-highlight-colors"
        "nvim-lsp-file-operations"
        "nvim-lspconfig"
        "nvim-nio"
        "nvim-vtsls"
        "nvim-window-picker"
        "none-ls.nvim"
        "nui.nvim"
        "package-info.nvim"
        "plenary.nvim"
        "resession.nvim"
        "rustaceanvim"
        "smart-splits.nvim"
        "snacks.nvim"
        "todo-comments.nvim"
        "toggleterm.nvim"
        "tsc.nvim"
        "schemastore.nvim"
        "venv-selector.nvim"
        "which-key.nvim"
        "mason-tool-installer"
        "communityImports"
        "disabled-mason"
        "astrocore-treesitter"
      ];
    };

    flake.neovimModules.default = self.neovimModules.sylveon;

    perSystem = {pkgs, ...}: {
      packages.sylveon =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [self.neovimModules.sylveon];
        }).neovim;
      packages.default = self.packages.${pkgs.system}.sylveon;
    };
  };
}
