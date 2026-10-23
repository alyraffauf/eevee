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
      vim.autocmds = lib.mkAfter [
        {
          event = ["FileType"];
          pattern = ["nix"];
          desc = "Use two-space indentation for Nix";
          command = "setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2";
        }
      ];
      eevee.plugins.communityImports = lib.mkAfter [{"import" = "astrocommunity.pack.nix";}];
    };
  };
}
