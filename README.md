# rpn-calculator

To setup on Nix run:

```bash
nix-shell -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [ cabal-install ])" --run "cabal init"
```