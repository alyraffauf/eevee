_: {
  flake.neovimModules.git = {config, ...}: {
    config.eevee.plugins."gitsigns.nvim" = [
      {
        name = "gitsigns.nvim";
        dir = "${config.eevee.sources.gitsignsNvim}";
      }
    ];
  };
}
