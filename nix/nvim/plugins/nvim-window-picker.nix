_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."nvim-window-picker" = [(eeveePlugin.mkDirSpec "nvim-window-picker" eeveePlugin.sources.nvimWindowPicker {})];
  };
}
