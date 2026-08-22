_: {
  flake.neovimModules.astronvim = {config, ...}: let
    sources = config.eevee.sources;
    mkDirSpec = name: package: extra:
      {
        inherit name;
        dir = "${package}";
      }
      // extra;
  in {
    config.vim.startPlugins = [sources.astronvim];

    config.eevee.astroNvimOpts = {
      mapleader = " ";
      maplocalleader = ",";
      icons_enabled = true;
      pin_plugins = null;
      update_notifications = true;
    };

    config.eevee.plugins = {
      "AstroNvim" = [
        (mkDirSpec "AstroNvim" sources.astronvim {
          version = "^6";
          import = "astronvim.plugins";
          opts = {
            mapleader = " ";
            maplocalleader = ",";
            icons_enabled = true;
            pin_plugins = null;
            update_notifications = true;
          };
        })
      ];
      "astrocommunity" = [(mkDirSpec "astrocommunity" sources.astrocommunity {})];
      "better-escape.nvim" = [(mkDirSpec "better-escape.nvim" sources.betterEscape {})];
      "chezmoi.nvim" = [(mkDirSpec "chezmoi.nvim" sources.chezmoi {})];
      "chezmoi.vim" = [(mkDirSpec "chezmoi.vim" sources.chezmoiVim {})];
      "gopher.nvim" = [(mkDirSpec "gopher.nvim" sources.gopher {})];
      "schemastore.nvim" = [(mkDirSpec "schemastore.nvim" sources.schemastore {})];
    };
  };
}
