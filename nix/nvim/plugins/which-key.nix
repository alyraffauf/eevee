_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."which-key.nvim" = [(eeveePlugin.mkDirSpec "which-key.nvim" eeveePlugin.sources.whichKeyNvim {})];
  };
}
