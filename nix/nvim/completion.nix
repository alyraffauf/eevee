_: {
  flake.neovimModules.completion = {config, ...}: let
    sources = config.eevee.sources;
    spec = name: package: {
      inherit name;
      dir = "${package}";
    };
  in {
    config.eevee.plugins = {
      "blink.cmp" = [(spec "blink.cmp" sources.blinkCmp)];
      "blink.compat" = [(spec "blink.compat" sources.blinkCompat)];
      "friendly-snippets" = [(spec "friendly-snippets" sources.friendlySnippets)];
      "lazydev.nvim" = [(spec "lazydev.nvim" sources.lazydevNvim)];
      LuaSnip = [(spec "LuaSnip" sources.luasnip)];
      "nvim-autopairs" = [(spec "nvim-autopairs" sources.nvimAutopairs)];
    };
  };
}
