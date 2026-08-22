_: {
  flake.neovimModules.configLanguages = {
    lib,
    pkgs,
    config,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.dockerfile-language-server pkgs.taplo pkgs.terraform-ls pkgs.vscode-langservers-extracted];
      eevee.grammarPackages = lib.mkAfter [
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.dockerfile
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.toml
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.yaml
      ];
      eevee.astroLspOpts.servers = lib.mkAfter ["dockerls" "taplo" "terraformls"];
      eevee.plugins.communityImports = lib.mkAfter [
        {"import" = "astrocommunity.pack.chezmoi";}
        {"import" = "astrocommunity.pack.yaml";}
      ];
      eevee.plugins = {
        "chezmoi.nvim" = [
          {
            name = "chezmoi.nvim";
            dir = "${config.eevee.sources.chezmoi}";
          }
        ];
        "chezmoi.vim" = [
          {
            name = "chezmoi.vim";
            dir = "${config.eevee.sources.chezmoiVim}";
          }
        ];
        "schemastore.nvim" = [
          {
            name = "schemastore.nvim";
            dir = "${config.eevee.sources.schemastore}";
          }
        ];
      };
    };
  };
}
