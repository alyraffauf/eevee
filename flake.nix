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
      url = "github:max397574/better-escape.nvim/199dcc2643dec5d8dbdab4ec672cf405224dcb3b";
      flake = false;
    };

    chezmoi = {
      url = "github:xvzc/chezmoi.nvim/4167bbec76f693f481a5243f1be521ff0ccf1a6d";
      flake = false;
    };

    chezmoiVim = {
      url = "github:alker0/chezmoi.vim/7a498ea65f658993237fb0469001bdf71f68cf94";
      flake = false;
    };

    gopher = {
      url = "github:olexsmir/gopher.nvim/27ba078f14dd39fcd5e8a57d7009cdd77450ebbb";
      flake = false;
    };

    schemastore = {
      url = "github:b0o/schemastore.nvim/73e89eb3e536a4dd8f991c963bd37189520c9919";
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
      url = "github:Saghen/blink.compat/1454f14a8d855a578ceeba77c62538fa1459a67c";
      flake = false;
    };
    cmpDap = {
      url = "github:rcarriga/cmp-dap/ea92773e84c0ad3288c3bc5e452ac91559669087";
      flake = false;
    };
    codecompanionNvim = {
      url = "github:olimorris/codecompanion.nvim/v19.22.0";
      flake = false;
    };
    cratesNvim = {
      url = "github:saecki/crates.nvim/694357861ec9ebf12475ddcdd04ea45a0923c32d";
      flake = false;
    };
    friendlySnippets = {
      url = "github:rafamadriz/friendly-snippets/6cd7280adead7f586db6fccbd15d2cac7e2188b9";
      flake = false;
    };
    lazydevNvim = {
      url = "github:folke/lazydev.nvim/ff2cbcba459b637ec3fd165a2be59b7bbaeedf0d";
      flake = false;
    };
    gitsignsNvim = {
      url = "github:lewis6991/gitsigns.nvim/a462f416e2ce4744531c6256252dee99a7d34a83";
      flake = false;
    };
    guessIndentNvim = {
      url = "github:nmac427/guess-indent.nvim/84a4987ff36798c2fc1169cbaff67960aed9776f";
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
      url = "github:jay-babu/mason-null-ls.nvim/8e7806acaa87fae64f0bfde25bb4b87c18bd19b4";
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
      url = "github:windwp/nvim-autopairs/7b9923abad60b903ece7c52940e1321d39eccc79";
      flake = false;
    };
    nvimDap = {
      url = "git+https://codeberg.org/mfussenegger/nvim-dap?rev=9e848e09a697ee95302a3ef2dd43fd6eb709e570";
      flake = false;
    };
    nvimDapGo = {
      url = "github:leoluz/nvim-dap-go/b4421153ead5d726603b02743ea40cf26a51ed5f";
      flake = false;
    };
    nvimDapPython = {
      url = "git+https://codeberg.org/mfussenegger/nvim-dap-python?rev=1808458eba2b18f178f990e01376941a42c7f93b";
      flake = false;
    };
    nvimDapUi = {
      url = "github:rcarriga/nvim-dap-ui/cc9dd33aade7f20bae414d0cba163bc60d4d4b43";
      flake = false;
    };
    nvimHighlightColors = {
      url = "github:brenoprata10/nvim-highlight-colors/e4c7af0211866162d999ce0bdd6a029302e19139";
      flake = false;
    };
    nvimLspFileOperations = {
      url = "github:antosha417/nvim-lsp-file-operations/b9c795d3973e8eec22706af14959bc60c579e771";
      flake = false;
    };
    nvimLspconfig = {
      url = "github:neovim/nvim-lspconfig/v2.11.0";
      flake = false;
    };
    nvimNio = {
      url = "github:nvim-neotest/nvim-nio/edcc181a875301dd21840189aa2f2f9ad69fc172";
      flake = false;
    };
    nvimVtsls = {
      url = "github:yioneko/nvim-vtsls/0b5f73c9e50ce95842ea07bb3f05c7d66d87d14a";
      flake = false;
    };
    nvimWindowPicker = {
      url = "github:s1n7ax/nvim-window-picker/v2.4.0";
      flake = false;
    };
    noneLsNvim = {
      url = "github:nvimtools/none-ls.nvim/c4b82bb63b13856ba4d6b971b7aad3bb38fc6fe2";
      flake = false;
    };
    nuiNvim = {
      url = "github:MunifTanjim/nui.nvim/0.4.0";
      flake = false;
    };
    packageInfoNvim = {
      url = "github:vuki656/package-info.nvim/febe21a4de78e4bdc811fb6d4e16a0d008145db0";
      flake = false;
    };
    plenaryNvim = {
      url = "github:nvim-lua/plenary.nvim/74b06c6c75e4eeb3108ec01852001636d85a932b";
      flake = false;
    };
    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim/v9.2.0";
      flake = false;
    };
    smartSplitsNvim = {
      url = "github:mrjones2014/smart-splits.nvim/5e92431aa7f5e618c2f6825f682df6d94f6e0a02";
      flake = false;
    };
    snacksNvim = {
      url = "github:folke/snacks.nvim/882c996cf28183f4d63640de0b4c02ec886d01f2";
      flake = false;
    };
    todoCommentsNvim = {
      url = "github:folke/todo-comments.nvim/v1.5.0";
      flake = false;
    };
    toggletermNvim = {
      url = "github:akinsho/toggleterm.nvim/9a88eae817ef395952e08650b3283726786fb5fb";
      flake = false;
    };
    tscNvim = {
      url = "github:dmmulroy/tsc.nvim/v2.10.1";
      flake = false;
    };
    venvSelectorNvim = {
      url = "github:linux-cultist/venv-selector.nvim/cc4bb3975de8835291f9bb45889e96c6b2795fc4";
      flake = false;
    };
    whichKeyNvim = {
      url = "github:folke/which-key.nvim/3aab2147e74890957785941f0c1ad87d0a44c15a";
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
      url = "github:stevearc/resession.nvim/0983fbdd3fe938c80fb7dd33817f08f428426ac8";
      flake = false;
    };
    nvimTreesitterTextobjects = {
      url = "github:nvim-treesitter/nvim-treesitter-textobjects/898ee307df58f854d11cd7edd06472574d48014e";
      flake = false;
    };
    nvimTsAutotag = {
      url = "github:windwp/nvim-ts-autotag/88c1453db4ba7dd24131086fe51fdf74e587d275";
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
        overlays = [inputs.self.overlays.default];
      };

      aarch64-linux = import nixpkgs {
        system = "aarch64-linux";
        config.allowUnfree = true;
        overlays = [inputs.self.overlays.default];
      };

      x86_64-darwin = import nixpkgs {
        system = "x86_64-darwin";
        config.allowUnfree = true;
        overlays = [inputs.self.overlays.default];
      };

      x86_64-linux = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [inputs.self.overlays.default];
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
