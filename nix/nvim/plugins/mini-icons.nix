_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."mini.icons" = [(eeveePlugin.mkDirSpec "mini.icons" eeveePlugin.sources.miniIcons {})];
  };
}
