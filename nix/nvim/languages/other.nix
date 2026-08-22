_: {
  flake.neovimModules.otherLanguages = {
    lib,
    pkgs,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [
        pkgs.elixir-ls
        pkgs.glsl_analyzer
        pkgs.haskell-language-server
        pkgs.jinja-lsp
        pkgs.lemminx
        pkgs.ruby-lsp
        pkgs.sqls
        pkgs.texlab
        pkgs.tinymist
        pkgs.zls
      ];
      eevee.grammarPackages = lib.mkAfter [
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.gleam
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.ruby
      ];
      eevee.astroLspOpts.servers = lib.mkAfter [
        "elixirls"
        "gleam"
        "glsl_analyzer"
        "hls"
        "jinja_lsp"
        "lemminx"
        "ruby_lsp"
        "sqls"
        "texlab"
        "tinymist"
        "zls"
      ];
      eevee.plugins.communityImports = lib.mkAfter [
        {"import" = "astrocommunity.pack.gleam";}
      ];
    };
  };
}
