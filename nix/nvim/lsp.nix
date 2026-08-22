_: {
  flake.neovimModules.lsp = {
    lib,
    config,
    ...
  }: let
    inline = lib.generators.mkLuaInline;
    mkDirSpec = name: package: extra:
      {
        inherit name;
        dir = "${package}";
      }
      // extra;
  in {
    config.eevee.astroLspOpts = {
      features = {
        codelens = true;
        inlay_hints = true;
        semantic_tokens = true;
      };

      on_attach = inline ''function(client, bufnr) end'';
    };

    config.eevee.plugins = {
      astrolsp = [
        (mkDirSpec "astrolsp" config.eevee.sources.astrolsp {opts = config.eevee.astroLspOpts;})
      ];
    };
  };
}
