_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."smart-splits.nvim" = [(eeveePlugin.mkDirSpec "smart-splits.nvim" eeveePlugin.sources.smartSplitsNvim {})];
  };
}
