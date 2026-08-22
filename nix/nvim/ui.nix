_: {
  flake.neovimModules.ui = {config, ...}: let
    sources = config.eevee.sources;
    mkDirSpec = name: package: extra:
      {
        inherit name;
        dir = "${package}";
      }
      // extra;
  in {
    config.eevee.astroUiOpts = {
      colorscheme = "catppuccin-frappe";

      highlights = {
        init = {};
        astrodark = {};
      };

      icons = {
        LSPLoading1 = "⠋";
        LSPLoading2 = "⠙";
        LSPLoading3 = "⠹";
        LSPLoading4 = "⠸";
        LSPLoading5 = "⠼";
        LSPLoading6 = "⠴";
        LSPLoading7 = "⠦";
        LSPLoading8 = "⠧";
        LSPLoading9 = "⠇";
        LSPLoading10 = "⠏";
      };
    };

    config.eevee.plugins = {
      astroui = [
        (mkDirSpec "astroui" sources.astroui {opts = config.eevee.astroUiOpts;})
      ];

      astrotheme = [(mkDirSpec "astrotheme" sources.astrotheme {})];
      catppuccin = [(mkDirSpec "catppuccin" sources.catppuccinNvim {})];
    };
  };
}
