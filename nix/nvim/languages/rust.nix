_: {
  flake.neovimModules.rust = {
    lib,
    pkgs,
    config,
    ...
  }: let
    mkDirSpec = name: package: extra:
      {
        inherit name;
        dir = "${package}";
      }
      // extra;
  in {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.rust-analyzer];

      eevee.grammarPackages = lib.mkAfter [pkgs.vimPlugins.nvim-treesitter.grammarPlugins.rust];
      eevee.astroLspOpts.servers = lib.mkAfter ["rust_analyzer"];
      eevee.plugins = {
        communityImports = lib.mkAfter [{"import" = "astrocommunity.pack.rust";}];
        "crates.nvim" = [(mkDirSpec "crates.nvim" config.eevee.sources.cratesNvim {})];
        rustaceanvim = [(mkDirSpec "rustaceanvim" config.eevee.sources.rustaceanvim {})];
      };
    };
  };
}
