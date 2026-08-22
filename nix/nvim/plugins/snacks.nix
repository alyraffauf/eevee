_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."snacks.nvim" = [(eeveePlugin.mkDirSpec "snacks.nvim" eeveePlugin.sources.snacksNvim {})];
  };
}
