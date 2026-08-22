_: {
  flake.neovimModules.resession = {
    lib,
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

    resessionOpts = {
      buf_filter = inline ''function(bufnr) return require("astrocore.buffer").is_restorable(bufnr) end'';
      tab_buf_filter = inline ''function(tabpage, bufnr) return vim.tbl_contains(vim.t[tabpage].bufs or {}, bufnr) end'';
      extensions.astrocore.enable_in_tab = true;
    };
  in {
    config.eevee.resessionOpts = resessionOpts;

    config.eevee.plugins = {
      "resession.nvim" = [
        (mkDirSpec "resession.nvim" config.eevee.sources.resessionNvim {
          opts = resessionOpts;
          config = inline ''
            function(_, opts)
              require("resession").setup(opts)
            end
          '';
        })
      ];
    };
  };
}
