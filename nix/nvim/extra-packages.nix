_: {
  flake.neovimModules.extraPackages = {pkgs, ...}: {
    config.vim.extraPackages = with pkgs; [
      curl
      git
      imagemagick
      tree-sitter
    ];
  };
}
