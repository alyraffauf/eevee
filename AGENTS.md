# Work in Eevee

Eevee provides NVF modules under `nix/nvim/` and editor packages under
`nix/packages/`.

## Add an editor

Create `nix/packages/<editor>/default.nix`. Use
`nix/packages/sylveon/default.nix` as the starting point for its imports,
options, and plugin order. Put reusable Neovim configuration in `nix/nvim/`.

## Check a change

Use `nix develop` for the pinned tools. Before committing, run:

```sh
nix fmt
nix flake check
```

For editor configuration changes, build the affected package. For Sylveon:

```sh
nix build .#sylveon
```
