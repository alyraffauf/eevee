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

    baseGrammarPackages = with p.nvim-treesitter.grammarPlugins; [
      diff
      git_config
      gitignore
      markdown
      markdown_inline
      query
      vim
      vimdoc
    ];
    grammarPackages = config.eevee.grammarPackages;
    grammarBundle = pkgs.symlinkJoin {
      name = "nvim-treesitter-grammars";
      paths = ["${p.nvim-treesitter}/runtime"] ++ grammarPackages;
    };
    treesitter = p.nvim-treesitter.withPlugins (_: grammarPackages);
  in {
    config.eevee.grammarPackages = baseGrammarPackages;
    config.eevee.grammarBundle = grammarBundle;
    config.eevee.treesitter = treesitter;

    config.eevee.plugins = {
      "nvim-treesitter" = [(mkDirSpec "nvim-treesitter" treesitter {})];
      "nvim-treesitter-textobjects" = [
        (mkDirSpec "nvim-treesitter-textobjects" sources.nvimTreesitterTextobjects {})
      ];
    };
  };
}
