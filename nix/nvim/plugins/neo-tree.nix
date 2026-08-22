_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."neo-tree.nvim" = [
      (eeveePlugin.mkDirSpec "neo-tree.nvim" eeveePlugin.sources.neoTreeNvim {
        dependencies = ["plenary.nvim" "nui.nvim" "nvim-web-devicons"];
        opts.filesystem.filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = false;
        };
        init = eeveePlugin.inline ''
          function()
            vim.api.nvim_create_autocmd("VimEnter", {
              callback = function() vim.schedule(function() vim.cmd "Neotree show" end) end,
            })
          end
        '';
      })
    ];
  };
}
