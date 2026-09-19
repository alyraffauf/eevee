_: {
  flake.neovimModules.python = {
    lib,
    pkgs,
    config,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.ruff pkgs.ty];
      eevee.grammarPackages = lib.mkAfter [pkgs.vimPlugins.nvim-treesitter.grammarPlugins.python];
      eevee.astroLspOpts.servers = lib.mkAfter ["ty" "ruff"];
      eevee.plugins = {
        communityImports = lib.mkAfter [
          {"import" = "astrocommunity.pack.python.base";}
          {"import" = "astrocommunity.pack.python.ty";}
          {"import" = "astrocommunity.pack.python.ruff";}
        ];
        "nvim-dap-python" = [
          {
            name = "nvim-dap-python";
            dir = "${config.eevee.sources.nvimDapPython}";
          }
        ];
        "venv-selector.nvim" = [
          {
            name = "venv-selector.nvim";
            dir = "${config.eevee.sources.venvSelectorNvim}";
          }
        ];
      };
    };
  };
}
