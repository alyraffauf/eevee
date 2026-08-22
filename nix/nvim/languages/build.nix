_: {
  flake.neovimModules.build = {
    lib,
    pkgs,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.autotools-language-server pkgs.clang-tools pkgs.cmake-language-server pkgs.just-lsp];
      eevee.grammarPackages = lib.mkAfter [pkgs.vimPlugins.nvim-treesitter.grammarPlugins.c];
      eevee.astroLspOpts.servers = lib.mkAfter ["autotools_ls" "clangd" "cmake" "just"];
    };
  };
}
