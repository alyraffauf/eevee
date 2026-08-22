_: {
  flake.neovimModules.mason = {
    lib,
    config,
    ...
  }: let
    sources = config.eevee.sources;
    inline = lib.generators.mkLuaInline;
    spec = name: package: {
      inherit name;
      dir = "${package}";
    };
  in {
    config.eevee.plugins = {
      "mason.nvim" = [(spec "mason.nvim" sources.masonNvim)];
      "mason-lspconfig.nvim" = [(spec "mason-lspconfig.nvim" sources.masonLspconfigNvim)];
      "mason-null-ls.nvim" = [(spec "mason-null-ls.nvim" sources.masonNullLsNvim)];
      "mason-nvim-dap.nvim" = [(spec "mason-nvim-dap.nvim" sources.masonNvimDapNvim)];
      "mason-tool-installer" = [(inline ''{ "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false }'')];
      disabled-mason = map inline [
        ''{ "mason-org/mason.nvim", enabled = false }''
        ''{ "mason-org/mason-lspconfig.nvim", enabled = false }''
        ''{ "jay-babu/mason-null-ls.nvim", enabled = false }''
        ''{ "jay-babu/mason-nvim-dap.nvim", enabled = false }''
        ''{ "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false }''
      ];
    };
  };
}
