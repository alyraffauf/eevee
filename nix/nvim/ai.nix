_: {
  flake.neovimModules.ai = {config, ...}: {
    config.eevee.plugins."codecompanion.nvim" = [
      {
        name = "codecompanion.nvim";
        dir = "${config.eevee.sources.codecompanionNvim}";
        version = "^19.0.0";
        dependencies = ["plenary.nvim" "nvim-treesitter"];
        opts = {};
      }
    ];
  };
}
