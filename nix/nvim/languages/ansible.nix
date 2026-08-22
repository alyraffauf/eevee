_: {
  flake.neovimModules.ansible = {
    lib,
    pkgs,
    config,
    ...
  }: {
    config = {
      vim.extraPackages = lib.mkAfter [pkgs.ansible-language-server];
      eevee.astroLspOpts.servers = lib.mkAfter ["ansiblels"];
      eevee.plugins.communityImports = lib.mkAfter [{"import" = "astrocommunity.pack.ansible";}];
      eevee.plugins."ansible-vim" = [
        {
          name = "ansible-vim";
          dir = "${config.eevee.sources.ansibleVim}";
        }
      ];
    };
  };
}
