_: {
  flake.neovimModules.astrocommunity = {config, ...}: let
    communityImports = map (path: {"import" = path;}) [
      "astrocommunity.recipes.heirline-vscode-winbar"
      "astrocommunity.recipes.neovide"
      "astrocommunity.colorscheme.catppuccin"
    ];
  in {
    config.vim.startPlugins = [config.eevee.sources.astrocommunity];

    config.eevee.plugins = {
      inherit communityImports;
    };
  };
}
