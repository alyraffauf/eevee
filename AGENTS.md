# Work in Eevee

Eevee provides NVF modules in `nix/nvim/` and editor packages in `nix/packages/`.

## Add an editor

Create `nix/packages/<editor>/default.nix`, using `nix/packages/sylveon/default.nix` as the reference for imports, options, and plugin order. Put reusable Neovim configuration in `nix/nvim/`.

## Validate changes

Use `nix develop` for pinned tools. Before committing, run:

```sh
nix fmt
nix flake check
```

Build every affected editor package after configuration changes. For Sylveon:

```sh
nix build .#sylveon
```
