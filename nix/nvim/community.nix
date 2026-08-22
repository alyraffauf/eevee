_: {
  flake.neovimModules.astrocommunity = {
    lib,
    config,
    ...
  }: let
    inline = lib.generators.mkLuaInline;
    communityImports = map (path: {"import" = path;}) [
      "astrocommunity.pack.ansible"
      "astrocommunity.pack.bash"
      "astrocommunity.pack.chezmoi"
      "astrocommunity.pack.gleam"
      "astrocommunity.pack.go"
      "astrocommunity.pack.json"
      "astrocommunity.pack.lua"
      "astrocommunity.pack.nix"
      "astrocommunity.pack.python"
      "astrocommunity.pack.rust"
      "astrocommunity.pack.typescript"
      "astrocommunity.pack.yaml"
      "astrocommunity.recipes.heirline-vscode-winbar"
      "astrocommunity.recipes.neovide"
      "astrocommunity.colorscheme.catppuccin"
    ];
  in {
    config.vim.startPlugins = [config.eevee.sources.astrocommunity];

    config.eevee.plugins = {
      inherit communityImports;
      disabled-mason = [
        (inline ''{ "mason-org/mason.nvim", enabled = false }'')
        (inline ''{ "mason-org/mason-lspconfig.nvim", enabled = false }'')
        (inline ''{ "jay-babu/mason-null-ls.nvim", enabled = false }'')
        (inline ''{ "jay-babu/mason-nvim-dap.nvim", enabled = false }'')
        (inline ''{ "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false }'')
      ];
    };
  };
}
