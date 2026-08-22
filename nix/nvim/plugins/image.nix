_: {
  config.flake.neovimModules.plugins = {eeveePlugin, ...}: {
    config.eevee.plugins."image.nvim" = [
      (eeveePlugin.mkDirSpec "image.nvim" eeveePlugin.sources.imageNvim {
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
  };
}
