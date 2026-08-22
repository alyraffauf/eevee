_: {
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        deadnix
        git
        nixd
        statix
      ];

      shellHook = ''
        echo "eevee development shell"
      '';
    };
  };
}
