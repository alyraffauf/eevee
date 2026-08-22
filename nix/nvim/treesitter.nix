_: {
  flake.neovimModules.treesitter = {
    pkgs,
    config,
    ...
  }: let
    p = pkgs.vimPlugins;
    sources = config.eevee.sources;
    mkDirSpec = name: package: extra:
      {
        inherit name;
        dir = "${package}";
      }
      // extra;

    grammarPackages = with p.nvim-treesitter.grammarPlugins; [
      bash
      c
      css
      diff
      dockerfile
      fish
      git_config
      gitignore
      gleam
      go
      gomod
      gosum
      gowork
      html
      javascript
      jsdoc
      json
      lua
      luap
      markdown
      markdown_inline
      nix
      python
      query
      ruby
      rust
      toml
      tsx
      typescript
      vim
      vimdoc
      yaml
    ];
    grammarQueryPackages = map (grammar: grammar.passthru.associatedQuery) grammarPackages;
    grammarBundle = pkgs.symlinkJoin {
      name = "nvim-treesitter-grammars";
      paths = grammarPackages ++ grammarQueryPackages;
    };
    treesitter = p.nvim-treesitter.withPlugins (_: grammarPackages);
  in {
    config.eevee.grammarPackages = grammarPackages;
    config.eevee.grammarBundle = grammarBundle;
    config.eevee.treesitter = treesitter;

    config.eevee.plugins = {
      "nvim-treesitter" = [(mkDirSpec "nvim-treesitter" treesitter {})];
      "nvim-treesitter-textobjects" = [
        (mkDirSpec "nvim-treesitter-textobjects" sources.nvimTreesitterTextobjects {})
      ];
      "nvim-ts-autotag" = [(mkDirSpec "nvim-ts-autotag" sources.nvimTsAutotag {})];
    };
  };
}
