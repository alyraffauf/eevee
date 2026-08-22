{
  inputs,
  lib,
  ...
}: let
  pluginDefinitions = [
    ["astronvim" "astronvim"]
    ["astrocommunity" "astrocommunity"]
    ["betterEscape" "better-escape.nvim"]
    ["chezmoi" "chezmoi.nvim"]
    ["chezmoiVim" "chezmoi.vim"]
    ["gopher" "gopher.nvim"]
    ["schemastore" "schemastore.nvim"]
    ["aerialNvim" "aerial.nvim"]
    ["ansibleVim" "ansible-vim"]
    ["blinkCmp" "blink.cmp"]
    ["blinkCompat" "blink.compat"]
    ["cmpDap" "cmp-dap"]
    ["codecompanionNvim" "codecompanion.nvim"]
    ["cratesNvim" "crates.nvim"]
    ["friendlySnippets" "friendly-snippets"]
    ["lazydevNvim" "lazydev.nvim"]
    ["gitsignsNvim" "gitsigns.nvim"]
    ["guessIndentNvim" "guess-indent.nvim"]
    ["heirlineNvim" "heirline.nvim"]
    ["imageNvim" "image.nvim"]
    ["masonNvim" "mason.nvim"]
    ["masonLspconfigNvim" "mason-lspconfig.nvim"]
    ["masonNullLsNvim" "mason-null-ls.nvim"]
    ["masonNvimDapNvim" "mason-nvim-dap.nvim"]
    ["miniIcons" "mini.icons"]
    ["luasnip" "LuaSnip"]
    ["miniMap" "mini.map"]
    ["neoTreeNvim" "neo-tree.nvim"]
    ["nvimWebDevicons" "nvim-web-devicons"]
    ["nvimAutopairs" "nvim-autopairs"]
    ["nvimDap" "nvim-dap"]
    ["nvimDapGo" "nvim-dap-go"]
    ["nvimDapPython" "nvim-dap-python"]
    ["nvimDapUi" "nvim-dap-ui"]
    ["nvimHighlightColors" "nvim-highlight-colors"]
    ["nvimLspFileOperations" "nvim-lsp-file-operations"]
    ["nvimLspconfig" "nvim-lspconfig"]
    ["nvimNio" "nvim-nio"]
    ["nvimVtsls" "nvim-vtsls"]
    ["nvimWindowPicker" "nvim-window-picker"]
    ["noneLsNvim" "none-ls.nvim"]
    ["nuiNvim" "nui.nvim"]
    ["packageInfoNvim" "package-info.nvim"]
    ["plenaryNvim" "plenary.nvim"]
    ["rustaceanvim" "rustaceanvim"]
    ["smartSplitsNvim" "smart-splits.nvim"]
    ["snacksNvim" "snacks.nvim"]
    ["todoCommentsNvim" "todo-comments.nvim"]
    ["toggletermNvim" "toggleterm.nvim"]
    ["tscNvim" "tsc.nvim"]
    ["venvSelectorNvim" "venv-selector.nvim"]
    ["whichKeyNvim" "which-key.nvim"]
    ["lazyNvim" "lazy.nvim"]
    ["astrocore" "astrocore"]
    ["astrolsp" "astrolsp"]
    ["astroui" "astroui"]
    ["astrotheme" "astrotheme"]
    ["catppuccinNvim" "catppuccin"]
    ["resessionNvim" "resession.nvim"]
    ["nvimTreesitterTextobjects" "nvim-treesitter-textobjects"]
    ["nvimTsAutotag" "nvim-ts-autotag"]
  ];

  mkPluginSources = pkgs:
    lib.listToAttrs (map (plugin: let
        inputName = builtins.elemAt plugin 0;
        packageName = builtins.elemAt plugin 1;
      in {
        name = inputName;
        value = pkgs.vimUtils.buildVimPlugin {
          pname = packageName;
          version = "unstable-${builtins.substring 0 7 inputs.${inputName}.rev}";
          src = inputs.${inputName};
          doCheck = false;
        };
      })
      pluginDefinitions);

  mkModuleOption = description:
    lib.mkOption {
      type = lib.types.deferredModule;
      default = {};
      inherit description;
    };
in {
  options.flake.neovimModules = {
    ai = mkModuleOption "AI assistant integration.";
    ansible = mkModuleOption "Ansible language support.";
    astronvim = mkModuleOption "AstroNvim configuration.";
    astrocommunity = mkModuleOption "AstroCommunity imports.";
    base = mkModuleOption "Shared Eevee module options and plugin packages.";
    build = mkModuleOption "Build-system language support.";
    completion = mkModuleOption "Completion and snippet support.";
    configLanguages = mkModuleOption "Configuration language support.";
    core = mkModuleOption "Astrocore settings and mappings.";
    debugging = mkModuleOption "Debug adapter support.";
    extraPackages = mkModuleOption "Language servers and command-line tools.";
    formatting = mkModuleOption "Formatting and diagnostics.";
    go = mkModuleOption "Go language support.";
    git = mkModuleOption "Git integration.";
    jvm = mkModuleOption "JVM language support.";
    lsp = mkModuleOption "Astrolsp settings.";
    lua = mkModuleOption "Lua language support.";
    mason = mkModuleOption "Mason integration.";
    nix = mkModuleOption "Nix language support.";
    otherLanguages = mkModuleOption "Additional language support.";
    plugins = mkModuleOption "Extra Lazy plugin specifications.";
    python = mkModuleOption "Python language support.";
    resession = mkModuleOption "Resession configuration.";
    rust = mkModuleOption "Rust language support.";
    shell = mkModuleOption "Shell language support.";
    terminal = mkModuleOption "Terminal integration.";
    treesitter = mkModuleOption "Tree-sitter configuration.";
    ui = mkModuleOption "Astroui and theme settings.";
    web = mkModuleOption "Web language support.";
  };

  config.flake.neovimModules.base = {
    lib,
    pkgs,
    config,
    ...
  }: let
    toLua = value: lib.generators.toLua {} value;
  in {
    options.eevee.plugins = lib.mkOption {
      type = lib.types.attrsOf (lib.types.listOf lib.types.anything);
      default = {};
      description = "Lazy plugin specs keyed by eevee.pluginOrder.";
    };
    options.eevee.sources = lib.mkOption {
      type = lib.types.attrsOf lib.types.package;
      default = {};
      description = "Vim plugins built from pinned flake inputs.";
    };
    options.eevee.pluginOrder = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "Load order for eevee.plugins.";
    };
    options.eevee.pluginSpecs = lib.mkOption {
      type = lib.types.listOf lib.types.anything;
      default = [];
      description = "AstroNvim Lazy plugin specs in load order.";
    };
    options.eevee.lazyOptions = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Lazy.nvim options.";
    };
    options.eevee.grammarBundle = lib.mkOption {
      type = lib.types.package;
      default = pkgs.emptyDirectory;
      description = "Symlinked Tree-sitter grammars and queries.";
    };
    options.eevee.grammarPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "Tree-sitter grammars.";
    };
    options.eevee.treesitter = lib.mkOption {
      type = lib.types.package;
      default = pkgs.emptyDirectory;
      description = "nvim-treesitter with its grammars.";
    };
    options.eevee.resessionOpts = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Resession opts.";
    };
    options.eevee.astroNvimOpts = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "AstroNvim opts.";
    };
    options.eevee.astroCoreOpts = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Astrocore opts.";
    };
    options.eevee.astroLspOpts = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Astrolsp opts.";
    };
    options.eevee.astroUiOpts = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Astroui opts.";
    };

    config = {
      vim = {
        lazy = {
          enable = false;
          enableLznAutoRequire = false;
        };
        treesitter = {
          enable = true;
          grammars = config.eevee.grammarPackages;
        };
        startPlugins = [config.eevee.sources.lazyNvim config.eevee.treesitter config.eevee.grammarBundle] ++ config.eevee.grammarPackages;
        luaConfigRC.eevee = inputs.nvf.lib.nvim.dag.entryAfter ["mappings"] ''
          require("lazy").setup(${toLua config.eevee.pluginSpecs}, ${toLua config.eevee.lazyOptions})
          require("resession").setup(${toLua config.eevee.resessionOpts})
          vim.opt.rtp:prepend("${toString config.eevee.grammarBundle}")

          local treesitter_group = vim.api.nvim_create_augroup("eevee_treesitter", { clear = true })
          local enable_treesitter = function(args)
            if vim.bo[args.buf].filetype ~= "" then pcall(vim.treesitter.start, args.buf) end
          end
          vim.api.nvim_create_autocmd("FileType", {
            group = treesitter_group,
            callback = enable_treesitter,
          })
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            enable_treesitter { buf = bufnr }
          end
        '';
      };
      eevee.pluginSpecs = lib.concatLists (map (name: config.eevee.plugins.${name} or []) config.eevee.pluginOrder);
      eevee.sources = mkPluginSources pkgs;
    };
  };
}
