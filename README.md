# eevee

My [NVF](https://github.com/NotAShelf/nvf) modules for Neovim and Sylveon, my
packaged AstroNvim configuration.

## Use Sylveon

Run Sylveon directly:

```sh
nix run github:alyraffauf/eevee#sylveon
```

To use its configuration in your own NVF build, add the flake input and import
its module:

```nix
{
  inputs.eevee.url = "github:alyraffauf/eevee";

  imports = [inputs.eevee.neovimModules.sylveon];
}
```

`neovimModules.default` is an alias for `neovimModules.sylveon`.

## Use individual modules

`neovimModules.base` provides the pinned plugins and Lazy setup. Import it
before the modules you want:

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

## Repository layout

```text
nix/nvim/           Reusable NVF modules
nix/packages/       Packaged editors
```

## Development

Enter the pinned development shell with `nix develop`, or run `direnv allow` to
load it automatically. Then run:

```sh
nix fmt
nix flake check
```

After changing Sylveon or its imported modules, build and test the package:

```sh
nix build .#sylveon
nix run .#sylveon
```

This project is available under the [MIT License](LICENSE.md).
