{
  description = "AstroNvim distribution packaged as an NVF module";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    import-tree.url = "github:denful/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astronvim = {
      url = "github:AstroNvim/AstroNvim";
      flake = false;
    };

    astrocommunity = {
      url = "github:AstroNvim/astrocommunity";
      flake = false;
    };

    betterEscape = {
      url = "github:max397574/better-escape.nvim";
      flake = false;
    };

    chezmoi = {
      url = "github:xvzc/chezmoi.nvim";
      flake = false;
    };

    chezmoiVim = {
      url = "github:alker0/chezmoi.vim";
      flake = false;
    };

    gopher = {
      url = "github:olexsmir/gopher.nvim";
      flake = false;
    };

    schemastore = {
      url = "github:b0o/schemastore.nvim";
      flake = false;
    };

    aerialNvim = {
      url = "github:stevearc/aerial.nvim/v4.0.0";
      flake = false;
    };

    ansibleVim = {
      url = "github:pearofducks/ansible-vim/5.0";
      flake = false;
    };

    blinkCmp = {
      url = "github:Saghen/blink.cmp/v1.10.2";
      flake = false;
    };

    blinkCompat = {
      url = "github:Saghen/blink.compat";
      flake = false;
    };

    cmpDap = {
      url = "github:rcarriga/cmp-dap";
      flake = false;
    };

    codecompanionNvim = {
      url = "github:olimorris/codecompanion.nvim/v19.22.0";
      flake = false;
    };

    cratesNvim = {
      url = "github:saecki/crates.nvim";
      flake = false;
    };

    friendlySnippets = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };

    lazydevNvim = {
      url = "github:folke/lazydev.nvim";
      flake = false;
    };

    gitsignsNvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };

    guessIndentNvim = {
      url = "github:nmac427/guess-indent.nvim";
      flake = false;
    };

    heirlineNvim = {
      url = "github:rebelot/heirline.nvim/v1.0.8";
      flake = false;
    };

    imageNvim = {
      url = "github:3rd/image.nvim/v1.5.1";
      flake = false;
    };

    masonNvim = {
      url = "github:mason-org/mason.nvim/v2.3.1";
      flake = false;
    };

    masonLspconfigNvim = {
      url = "github:mason-org/mason-lspconfig.nvim/v2.3.0";
      flake = false;
    };

    masonNullLsNvim = {
      url = "github:jay-babu/mason-null-ls.nvim";
      flake = false;
    };

    masonNvimDapNvim = {
      url = "github:jay-babu/mason-nvim-dap.nvim/v2.5.2";
      flake = false;
    };

    miniIcons = {
      url = "github:nvim-mini/mini.icons/v0.18.0";
      flake = false;
    };

    luasnip = {
      url = "github:L3MON4D3/LuaSnip/v2.5.0";
      flake = false;
    };

    miniMap = {
      url = "github:nvim-mini/mini.map/v0.18.0";
      flake = false;
    };

    neoTreeNvim = {
      url = "github:nvim-neo-tree/neo-tree.nvim/3.41.0";
      flake = false;
    };

    nvimWebDevicons = {
      url = "github:nvim-tree/nvim-web-devicons/v0.100";
      flake = false;
    };

    nvimAutopairs = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };

    nvimDap = {
      url = "git+https://codeberg.org/mfussenegger/nvim-dap";
      flake = false;
    };

    nvimDapGo = {
      url = "github:leoluz/nvim-dap-go";
      flake = false;
    };

    nvimDapPython = {
      url = "git+https://codeberg.org/mfussenegger/nvim-dap-python";
      flake = false;
    };

    nvimDapUi = {
      url = "github:rcarriga/nvim-dap-ui";
      flake = false;
    };

    nvimHighlightColors = {
      url = "github:brenoprata10/nvim-highlight-colors";
      flake = false;
    };

    nvimLspFileOperations = {
      url = "github:antosha417/nvim-lsp-file-operations";
      flake = false;
    };

    nvimLspconfig = {
      url = "github:neovim/nvim-lspconfig/v2.11.0";
      flake = false;
    };

    nvimNio = {
      url = "github:nvim-neotest/nvim-nio";
      flake = false;
    };

    nvimVtsls = {
      url = "github:yioneko/nvim-vtsls";
      flake = false;
    };

    nvimWindowPicker = {
      url = "github:s1n7ax/nvim-window-picker/v2.4.0";
      flake = false;
    };

    noneLsNvim = {
      url = "github:nvimtools/none-ls.nvim";
      flake = false;
    };

    nuiNvim = {
      url = "github:MunifTanjim/nui.nvim/0.4.0";
      flake = false;
    };

    packageInfoNvim = {
      url = "github:vuki656/package-info.nvim";
      flake = false;
    };

    plenaryNvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim/v9.2.0";
      flake = false;
    };

    smartSplitsNvim = {
      url = "github:mrjones2014/smart-splits.nvim";
      flake = false;
    };

    snacksNvim = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };

    todoCommentsNvim = {
      url = "github:folke/todo-comments.nvim/v1.5.0";
      flake = false;
    };

    toggletermNvim = {
      url = "github:akinsho/toggleterm.nvim";
      flake = false;
    };

    tscNvim = {
      url = "github:dmmulroy/tsc.nvim/v2.10.1";
      flake = false;
    };

    venvSelectorNvim = {
      url = "github:linux-cultist/venv-selector.nvim";
      flake = false;
    };

    whichKeyNvim = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };

    lazyNvim = {
      url = "github:folke/lazy.nvim/v11.17.5";
      flake = false;
    };

    astrocore = {
      url = "github:AstroNvim/astrocore/v3.0.8";
      flake = false;
    };

    astrolsp = {
      url = "github:AstroNvim/astrolsp/v4.0.1";
      flake = false;
    };

    astroui = {
      url = "github:AstroNvim/astroui/v4.0.2";
      flake = false;
    };

    astrotheme = {
      url = "github:AstroNvim/astrotheme/v4.12.0";
      flake = false;
    };

    catppuccinNvim = {
      url = "github:catppuccin/nvim/v2.0.0";
      flake = false;
    };

    resessionNvim = {
      url = "github:stevearc/resession.nvim";
      flake = false;
    };

    nvimTreesitterTextobjects = {
      url = "github:nvim-treesitter/nvim-treesitter-textobjects";
      flake = false;
    };

    nvimTsAutotag = {
      url = "github:windwp/nvim-ts-autotag";
      flake = false;
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://alyraffauf.cachix.org"
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "alyraffauf.cachix.org-1:GQVrRGfjTtkPGS8M6y7Ik0z4zLt77O0N25ynv2gWzDM="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    ...
  }: let
    sharedPackageSets = {
      aarch64-darwin = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };

      aarch64-linux = import nixpkgs {
        system = "aarch64-linux";
        config.allowUnfree = true;
      };

      x86_64-linux = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };
  in
    flake-parts.lib.mkFlake {
      inherit inputs;
      specialArgs = {inherit sharedPackageSets;};
    } {
      systems = builtins.attrNames sharedPackageSets;

      perSystem = {system, ...}: {
        _module.args.pkgs = sharedPackageSets.${system};
      };

      imports = [
        (inputs.import-tree ./nix)
        inputs.treefmt-nix.flakeModule
      ];
    };
}
