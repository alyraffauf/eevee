_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."heirline.nvim" = [(eeveePlugin.mkDirSpec "heirline.nvim" eeveePlugin.sources.heirlineNvim {})];
  };
}
