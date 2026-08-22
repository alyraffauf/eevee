_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."nvim-lsp-file-operations" = [(eeveePlugin.mkDirSpec "nvim-lsp-file-operations" eeveePlugin.sources.nvimLspFileOperations {})];
  };
}
