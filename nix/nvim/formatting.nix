_: {
  flake.neovimModules.formatting = {
    lib,
    config,
    ...
  }: let
    inline = lib.generators.mkLuaInline;
  in {
    config.eevee.astroLspOpts.formatting = {
      format_on_save = {
        enabled = true;
        allow_filetypes = [];
        ignore_filetypes = ["python"];
      };
      disabled = [];
      timeout_ms = 1000;
    };
    config.eevee.plugins."none-ls.nvim" = [
      {
        name = "none-ls.nvim";
        dir = "${config.eevee.sources.noneLsNvim}";
        opts = inline ''function(_, opts) opts.temp_dir = vim.fn.stdpath("cache"); return opts end'';
      }
    ];
  };
}
