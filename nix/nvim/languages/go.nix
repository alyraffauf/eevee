_: {
  flake.neovimModules.go = {
    lib,
    pkgs,
    config,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.gopls];
      eevee.grammarPackages = lib.mkAfter [
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.go
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.gomod
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.gosum
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.gowork
      ];
      eevee.astroLspOpts.servers = lib.mkAfter ["gopls"];
      eevee.plugins = {
        communityImports = lib.mkAfter [{"import" = "astrocommunity.pack.go";}];
        "gopher.nvim" = [
          {
            name = "gopher.nvim";
            dir = "${config.eevee.sources.gopher}";
          }
        ];
        "nvim-dap-go" = [
          {
            name = "nvim-dap-go";
            dir = "${config.eevee.sources.nvimDapGo}";
          }
        ];
      };
    };
  };
}
