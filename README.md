# eevee

Eevee is a set of [NVF](https://github.com/NotAShelf/nvf) modules for Neovim. `sylveon` is my personal neovim package, delivered pre-wrapped with my configs.

## Use Sylveon

```nix
{
  inputs.eevee.url = "github:alyraffauf/eevee";

  imports = [inputs.eevee.neovimModules.sylveon];
}
```

Build or run it with Nix:

```bash
nix build .#sylveon
nix run .#sylveon
```

## Use the modules

`neovimModules.base` provides the pinned plugins and Lazy setup. Import it before the modules you want.

```nix
{
  imports = [
    inputs.eevee.neovimModules.base
    inputs.eevee.neovimModules.astronvim
    inputs.eevee.neovimModules.astrocommunity
    inputs.eevee.neovimModules.treesitter
  ];
}
```

The modules live in `nix/nvim/`. Add an editor in `nix/packages/<editor>/default.nix`. Start with `nix/packages/sylveon/default.nix`, then change its imports, options, and plugin order.

## Develop

```bash
nix develop
nix fmt
nix flake check
```
