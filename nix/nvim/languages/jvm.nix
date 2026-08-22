_: {
  flake.neovimModules.jvm = {
    lib,
    pkgs,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.clojure-lsp pkgs.jdt-language-server pkgs.kotlin-language-server];
      eevee.astroLspOpts.servers = lib.mkAfter ["clojure_lsp" "jdtls" "kotlin_language_server"];
    };
  };
}
