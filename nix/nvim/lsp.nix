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

      formatting = {
        format_on_save = {
          enabled = true;
          allow_filetypes = [];
          ignore_filetypes = ["python"];
        };
        disabled = [];
        timeout_ms = 1000;
      };

      servers = [
        "ansiblels"
        "astro"
        "autotools_ls"
        "bashls"
        "clangd"
        "clojure_lsp"
        "cmake"
        "cssls"
        "dockerls"
        "elixirls"
        "fish_lsp"
        "gleam"
        "glsl_analyzer"
        "gopls"
        "hls"
        "html"
        "jdtls"
        "jinja_lsp"
        "jsonls"
        "just"
        "kotlin_language_server"
        "lemminx"
        "lua_ls"
        "nixd"
        "ruby_lsp"
        "rust_analyzer"
        "sqls"
        "svelte"
        "taplo"
        "terraformls"
        "texlab"
        "tinymist"
        "ts_ls"
        "ty"
        "zls"
      ];

      on_attach = inline ''function(client, bufnr) end'';
    };

    config.eevee.plugins = {
      astrolsp = [
        (mkDirSpec "astrolsp" config.eevee.sources.astrolsp {opts = config.eevee.astroLspOpts;})
      ];
    };
  };
}
