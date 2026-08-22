_: {
  flake.neovimModules.lua = {
    lib,
    pkgs,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.lua-language-server pkgs.stylua];
      eevee.grammarPackages = lib.mkAfter [
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.lua
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.luap
      ];
      eevee.astroLspOpts.servers = lib.mkAfter ["lua_ls"];
      eevee.plugins.communityImports = lib.mkAfter [{"import" = "astrocommunity.pack.lua";}];
    };
  };
}
