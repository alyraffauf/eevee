_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."aerial.nvim" = [(eeveePlugin.mkDirSpec "aerial.nvim" eeveePlugin.sources.aerialNvim {})];
  };
}
