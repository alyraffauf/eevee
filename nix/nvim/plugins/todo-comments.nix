_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."todo-comments.nvim" = [(eeveePlugin.mkDirSpec "todo-comments.nvim" eeveePlugin.sources.todoCommentsNvim {})];
  };
}
