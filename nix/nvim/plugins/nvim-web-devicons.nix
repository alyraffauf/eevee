_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."nvim-web-devicons" = [(eeveePlugin.mkDirSpec "nvim-web-devicons" eeveePlugin.sources.nvimWebDevicons {})];
  };
}
