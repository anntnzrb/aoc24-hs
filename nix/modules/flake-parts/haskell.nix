{ root, inputs, ... }:
{
  imports = [
    inputs.haskell-flake.flakeModule
  ];
  perSystem =
    {
      self',
      lib,
      config,
      pkgs,
      ...
    }:
    {
      haskellProjects.default = {
        projectRoot = builtins.toString (
          lib.fileset.toSource {
            inherit root;
            fileset = lib.fileset.unions [
              (root + /src)
              (root + /aoc24.cabal)
              (root + /COPYING)
              (root + /README.md)
            ];
          }
        );

        devShell = {
          hlsCheck.enable = false;
        };

        autoWire = [
          "packages"
          "apps"
          "checks"
        ];
      };
    };
}
