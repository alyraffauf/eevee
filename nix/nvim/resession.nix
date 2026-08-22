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
      buf_filter = inline ''
        function(bufnr)
          if not require("astrocore.buffer").is_restorable(bufnr) then return false end

          local path = vim.api.nvim_buf_get_name(bufnr)
          return path == "" or vim.fn.isdirectory(vim.fn.fnamemodify(path, ":h")) == 1
        end
      '';

      tab_buf_filter = inline ''function(tabpage, bufnr) return vim.tbl_contains(vim.t[tabpage].bufs or {}, bufnr) end'';

      extensions.astrocore.enable_in_tab = true;
    };
  in {
    config.eevee.resessionOpts = resessionOpts;
    config.eevee.astroCoreOpts.autocmds.restore_session = [
      {
        event = "VimEnter";
        desc = "Restore previous directory session if Neovim opened with no arguments";
        nested = true;
        callback = inline ''
          function()
            if vim.fn.argc(-1) == 0 then
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end
        '';
      }
    ];

    config.eevee.plugins = {
      "resession.nvim" = [
        (mkDirSpec "resession.nvim" config.eevee.sources.resessionNvim {
          opts = resessionOpts;
          config = inline ''
            function(_, opts)
              local resession = require("resession")
              resession.setup(opts)
              resession.add_hook("post_load", function()
                for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                  local path = vim.api.nvim_buf_get_name(bufnr)
                  if path ~= "" and vim.fn.isdirectory(vim.fn.fnamemodify(path, ":h")) == 0 then
                    vim.api.nvim_buf_delete(bufnr, { force = true })
                  end
                end
              end)
            end
          '';
        })
      ];
    };
  };
}
