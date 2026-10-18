_: {
  flake.neovimModules.rust = {
    lib,
    pkgs,
    config,
    ...
  }: let
    inline = lib.generators.mkLuaInline;
    mkDirSpec = name: package: extra:
      {
        inherit name;
        dir = "${package}";
      }
      // extra;
  in {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.rust-analyzer pkgs.clippy pkgs.rustfmt];

      eevee.grammarPackages = lib.mkAfter [pkgs.vimPlugins.nvim-treesitter.grammarPlugins.rust];
      eevee.astroLspOpts.servers = lib.mkAfter ["rust_analyzer"];
      eevee.plugins = {
        communityImports = lib.mkAfter [{"import" = "astrocommunity.pack.rust";}];
        "crates.nvim" = [(mkDirSpec "crates.nvim" config.eevee.sources.cratesNvim {})];
        rustaceanvim = [
          (mkDirSpec "rustaceanvim" config.eevee.sources.rustaceanvim {
            init = inline ''
              function()
                if vim.fn.executable("codelldb") == 0 then
                  local settings = vim.g.rustaceanvim or {}
                  settings.dap = settings.dap or {}
                  settings.dap.adapter = false
                  vim.g.rustaceanvim = settings
                end
              end
            '';
          })
        ];
      };
    };
  };
}
