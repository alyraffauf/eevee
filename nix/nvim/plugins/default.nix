_: {
  config.flake.neovimModules.plugins = {
    lib,
    config,
    ...
  }: {
    _module.args.eeveePlugin = {
      sources = config.eevee.sources;
      inline = lib.generators.mkLuaInline;
      mkDirSpec = name: package: extra:
        {
          inherit name;
          dir = "${package}";
        }
        // extra;
    };
  };
}
