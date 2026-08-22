_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."nvim-lspconfig" = [(eeveePlugin.mkDirSpec "nvim-lspconfig" eeveePlugin.sources.nvimLspconfig {})];
  };
}
