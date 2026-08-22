_: {
  flake.neovimModules.web = {
    lib,
    pkgs,
    config,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [
        pkgs.astro-language-server
        pkgs.nodejs
        pkgs.oxlint
        pkgs.prettier
        pkgs.svelte-language-server
        pkgs.typescript-language-server
        pkgs.vscode-langservers-extracted
      ];
      eevee.grammarPackages = lib.mkAfter [
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.css
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.html
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.javascript
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.jsdoc
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.json
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.tsx
        pkgs.vimPlugins.nvim-treesitter.grammarPlugins.typescript
      ];
      eevee.astroLspOpts.servers = lib.mkAfter ["astro" "cssls" "html" "jsonls" "svelte" "ts_ls"];
      eevee.plugins = {
        communityImports = lib.mkAfter [
          {"import" = "astrocommunity.pack.json";}
          {"import" = "astrocommunity.pack.typescript";}
        ];
        "nvim-ts-autotag" = [
          {
            name = "nvim-ts-autotag";
            dir = "${config.eevee.sources.nvimTsAutotag}";
          }
        ];
        "nvim-vtsls" = [
          {
            name = "nvim-vtsls";
            dir = "${config.eevee.sources.nvimVtsls}";
          }
        ];
        "package-info.nvim" = [
          {
            name = "package-info.nvim";
            dir = "${config.eevee.sources.packageInfoNvim}";
          }
        ];
        "tsc.nvim" = [
          {
            name = "tsc.nvim";
            dir = "${config.eevee.sources.tscNvim}";
          }
        ];
      };
    };
  };
}
