_: {
  flake.neovimModules.core = {
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
  in {
    config.eevee.astroCoreOpts = {
      features = {
        large_buf = {
          size = 1024 * 256;
          lines = 10000;
        };

        autopairs = true;
        cmp = true;

        diagnostics = {
          virtual_text = true;
          virtual_lines = false;
        };

        highlighturl = true;
        notifications = true;
      };

      diagnostics = {
        virtual_text = true;
        underline = true;
      };

      filetypes = {
        extension.bu = "yaml";
        filename.".foorc" = "fooscript";
        pattern.".*%.bu%.tmpl" = "yaml";
        pattern.".*/etc/foo/.*" = "fooscript";
      };

      options = {
        opt = {
          relativenumber = false;
          number = true;
          spell = false;
          signcolumn = "yes";
          wrap = true;
          updatetime = 1000;
        };
      };

      autocmds = {
        alpha_autostart = false;

        autosave = [
          {
            event = ["InsertLeave" "CursorHold" "CursorHoldI"];
            callback = inline ''
              function(args)
                local buf = args.buf
                if vim.api.nvim_buf_get_name(buf) ~= ""
                  and vim.bo[buf].modifiable
                  and vim.bo[buf].buftype == ""
                  and vim.bo[buf].modified
                then
                  vim.api.nvim_buf_call(buf, function() vim.cmd "silent update" end)
                end
              end
            '';
          }
        ];
      };

      mappings = {
        n = {
          "]b" = inline ''{ function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" }'';
          "[b" = inline ''{ function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" }'';
          "<Leader>bd" = inline ''            {
                    function()
                      require("astroui.status.heirline").buffer_picker(
                        function(bufnr) require("astrocore.buffer").close(bufnr) end
                      )
                    end,
                    desc = "Close buffer from tabline",
                  }'';
          "<C-p>" = inline ''{ function() require("snacks.picker").commands() end, desc = "Command Palette" }'';
        };
      };

      treesitter = {
        highlight = true;
        indent = true;
        auto_install = false;

        ensure_installed = [
          "bash"
          "css"
          "diff"
          "dockerfile"
          "fish"
          "git_config"
          "gitignore"
          "gleam"
          "go"
          "gomod"
          "gowork"
          "html"
          "javascript"
          "json"
          "jsonc"
          "lua"
          "markdown"
          "markdown_inline"
          "nix"
          "python"
          "ruby"
          "toml"
          "tsx"
          "typescript"
          "vim"
          "yaml"
        ];
      };
    };

    config.eevee.plugins = {
      astrocore = [
        (mkDirSpec "astrocore" config.eevee.sources.astrocore {opts = config.eevee.astroCoreOpts;})
      ];

      astrocore-treesitter = [
        (inline ''          {
                        "AstroNvim/astrocore",
                        opts = function(_, opts)
                          opts.treesitter.ensure_installed = {}
                          opts.treesitter.auto_install = false
                          return opts
                        end,
                      }'')
      ];
    };
  };
}
