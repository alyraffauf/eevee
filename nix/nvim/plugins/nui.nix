_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."nui.nvim" = [(eeveePlugin.mkDirSpec "nui.nvim" eeveePlugin.sources.nuiNvim {})];
  };
}
