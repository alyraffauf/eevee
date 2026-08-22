_: {
  flake.neovimModules.debugging = {config, ...}: let
    sources = config.eevee.sources;
    spec = name: package: {
      inherit name;
      dir = "${package}";
    };
  in {
    config.eevee.plugins = {
      "cmp-dap" = [(spec "cmp-dap" sources.cmpDap)];
      "nvim-dap" = [(spec "nvim-dap" sources.nvimDap)];
      "nvim-dap-ui" = [(spec "nvim-dap-ui" sources.nvimDapUi)];
      "nvim-nio" = [(spec "nvim-nio" sources.nvimNio)];
    };
  };
}
