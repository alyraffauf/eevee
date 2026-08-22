_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."plenary.nvim" = [(eeveePlugin.mkDirSpec "plenary.nvim" eeveePlugin.sources.plenaryNvim {})];
  };
}
