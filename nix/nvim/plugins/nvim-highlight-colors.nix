_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."nvim-highlight-colors" = [(eeveePlugin.mkDirSpec "nvim-highlight-colors" eeveePlugin.sources.nvimHighlightColors {})];
  };
}
