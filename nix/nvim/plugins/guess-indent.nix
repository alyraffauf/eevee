_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."guess-indent.nvim" = [(eeveePlugin.mkDirSpec "guess-indent.nvim" eeveePlugin.sources.guessIndentNvim {})];
  };
}
