_: {
  flake.neovimModules.nix = {
    lib,
    pkgs,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.deadnix pkgs.nixd pkgs.statix];
      eevee.grammarPackages = lib.mkAfter [pkgs.vimPlugins.nvim-treesitter.grammarPlugins.nix];
      eevee.astroLspOpts.servers = lib.mkAfter ["nixd"];
      eevee.plugins.communityImports = lib.mkAfter [{"import" = "astrocommunity.pack.nix";}];
    };
  };
}
