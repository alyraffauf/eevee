_: {
  flake.neovimModules.plugins = {
    lib,
    config,
    ...
  }: let
    s = config.eevee.sources;
    inline = lib.generators.mkLuaInline;
    mkDirSpec = name: package: extra:
      {
        inherit name;
        dir = "${package}";
      }
      // extra;
  in {
    config.eevee.plugins = {
      "aerial.nvim" = [(mkDirSpec "aerial.nvim" s.aerialNvim {})];
      "ansible-vim" = [(mkDirSpec "ansible-vim" s.ansibleVim {})];
      "blink.cmp" = [(mkDirSpec "blink.cmp" s.blinkCmp {})];
      "blink.compat" = [(mkDirSpec "blink.compat" s.blinkCompat {})];
      "cmp-dap" = [(mkDirSpec "cmp-dap" s.cmpDap {})];
      "codecompanion.nvim" = [
        (mkDirSpec "codecompanion.nvim" s.codecompanionNvim {
          version = "^19.0.0";
          dependencies = ["plenary.nvim" "nvim-treesitter"];
          opts = {};
        })
      ];
      "crates.nvim" = [(mkDirSpec "crates.nvim" s.cratesNvim {})];
      "friendly-snippets" = [(mkDirSpec "friendly-snippets" s.friendlySnippets {})];
      "lazydev.nvim" = [(mkDirSpec "lazydev.nvim" s.lazydevNvim {})];
      "gitsigns.nvim" = [(mkDirSpec "gitsigns.nvim" s.gitsignsNvim {})];
      "guess-indent.nvim" = [(mkDirSpec "guess-indent.nvim" s.guessIndentNvim {})];
      "heirline.nvim" = [(mkDirSpec "heirline.nvim" s.heirlineNvim {})];
      "image.nvim" = [
        (mkDirSpec "image.nvim" s.imageNvim {
          build = false;
          opts = {
            backend = "kitty";
            processor = "magick_cli";
            integrations = {
              markdown = {
                enabled = true;
                clear_in_insert_mode = false;
                download_remote_images = true;
                only_render_image_at_cursor = true;
                only_render_image_at_cursor_mode = "popup";
                filetypes = ["markdown" "vimwiki"];
              };
              neorg = {
                enabled = true;
                filetypes = ["norg"];
              };
            };
            max_width = null;
            max_height = null;
            max_width_window_percentage = null;
            max_height_window_percentage = 50;
            window_overlap_clear_enabled = false;
            hijack_file_patterns = ["*.png" "*.jpg" "*.jpeg" "*.gif" "*.webp" "*.avif"];
          };
        })
      ];
      "mason.nvim" = [(mkDirSpec "mason.nvim" s.masonNvim {})];
      "mason-lspconfig.nvim" = [(mkDirSpec "mason-lspconfig.nvim" s.masonLspconfigNvim {})];
      "mason-null-ls.nvim" = [(mkDirSpec "mason-null-ls.nvim" s.masonNullLsNvim {})];
      "mason-nvim-dap.nvim" = [(mkDirSpec "mason-nvim-dap.nvim" s.masonNvimDapNvim {})];
      "mini.icons" = [(mkDirSpec "mini.icons" s.miniIcons {})];
      LuaSnip = [(mkDirSpec "LuaSnip" s.luasnip {})];
      "mini.map" = [
        (mkDirSpec "mini.map" s.miniMap {
          event = ["VeryLazy"];
          keys = [
            (inline ''{ "<Leader>um", function() require("mini.map").toggle() end, desc = "Toggle minimap" }'')
            (inline ''{ "<Leader>uM", function() require("mini.map").toggle_focus() end, desc = "Focus minimap" }'')
          ];
          config = inline ''            function(_, opts)
                          local mini_map = require "mini.map"
                          opts.integrations = {
                            mini_map.gen_integration.builtin_search(),
                            mini_map.gen_integration.diagnostic(),
                            mini_map.gen_integration.gitsigns(),
                          }
                          opts.window = { focusable = true, side = "right", width = 10, winblend = 25 }
                          mini_map.setup(opts)
                          mini_map.open()
                        end'';
        })
      ];
      "neo-tree.nvim" = [
        (mkDirSpec "neo-tree.nvim" s.neoTreeNvim {
          opts.filesystem.filtered_items = {
            hide_dotfiles = false;
            hide_gitignored = false;
          };
          init = inline ''            function()
                          vim.api.nvim_create_autocmd("VimEnter", {
                            callback = function() vim.schedule(function() vim.cmd "Neotree show" end) end,
                          })
                        end'';
        })
      ];
      "nvim-web-devicons" = [(mkDirSpec "nvim-web-devicons" s.nvimWebDevicons {})];
      "nvim-autopairs" = [(mkDirSpec "nvim-autopairs" s.nvimAutopairs {})];
      "nvim-dap" = [(mkDirSpec "nvim-dap" s.nvimDap {})];
      "nvim-dap-go" = [(mkDirSpec "nvim-dap-go" s.nvimDapGo {})];
      "nvim-dap-python" = [(mkDirSpec "nvim-dap-python" s.nvimDapPython {})];
      "nvim-dap-ui" = [(mkDirSpec "nvim-dap-ui" s.nvimDapUi {})];
      "nvim-highlight-colors" = [(mkDirSpec "nvim-highlight-colors" s.nvimHighlightColors {})];
      "nvim-lsp-file-operations" = [
        (mkDirSpec "nvim-lsp-file-operations" s.nvimLspFileOperations {})
      ];
      "nvim-lspconfig" = [(mkDirSpec "nvim-lspconfig" s.nvimLspconfig {})];
      "nvim-nio" = [(mkDirSpec "nvim-nio" s.nvimNio {})];
      "nvim-vtsls" = [(mkDirSpec "nvim-vtsls" s.nvimVtsls {})];
      "nvim-window-picker" = [(mkDirSpec "nvim-window-picker" s.nvimWindowPicker {})];
      "none-ls.nvim" = [(mkDirSpec "none-ls.nvim" s.noneLsNvim {})];
      "nui.nvim" = [(mkDirSpec "nui.nvim" s.nuiNvim {})];
      "package-info.nvim" = [(mkDirSpec "package-info.nvim" s.packageInfoNvim {})];
      "plenary.nvim" = [(mkDirSpec "plenary.nvim" s.plenaryNvim {})];
      "rustaceanvim" = [(mkDirSpec "rustaceanvim" s.rustaceanvim {})];
      "smart-splits.nvim" = [(mkDirSpec "smart-splits.nvim" s.smartSplitsNvim {})];
      "snacks.nvim" = [(mkDirSpec "snacks.nvim" s.snacksNvim {})];
      "todo-comments.nvim" = [(mkDirSpec "todo-comments.nvim" s.todoCommentsNvim {})];
      "toggleterm.nvim" = [(mkDirSpec "toggleterm.nvim" s.toggletermNvim {})];
      "tsc.nvim" = [(mkDirSpec "tsc.nvim" s.tscNvim {})];
      "venv-selector.nvim" = [(mkDirSpec "venv-selector.nvim" s.venvSelectorNvim {})];
      "which-key.nvim" = [(mkDirSpec "which-key.nvim" s.whichKeyNvim {})];
      "mason-tool-installer" = [
        (inline ''{ "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false }'')
      ];
    };
  };
}
