_: {
  flake.neovimModules.terminal = {config, ...}: {
    config.eevee.plugins."toggleterm.nvim" = [
      {
        name = "toggleterm.nvim";
        dir = "${config.eevee.sources.toggletermNvim}";
      }
    ];
  };
}
