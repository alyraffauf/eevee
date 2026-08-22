_: {
  flake.neovimModules.shell = {
    lib,
    pkgs,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.bash-language-server pkgs.fish-lsp pkgs.shellcheck pkgs.shfmt];
      eevee.grammarPackages = lib.mkAfter [
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.bash
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.fish
      ];
      eevee.astroLspOpts.servers = lib.mkAfter ["bashls" "fish_lsp"];
      eevee.plugins.communityImports = lib.mkAfter [
        {"import" = "astrocommunity.pack.bash";}
      ];
    };
  };
}
