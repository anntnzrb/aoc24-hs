{
  description = "Advent of Code 2024, in Haskell";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    nixos-unified.url = "github:srid/nixos-unified/master";
    haskell-flake.url = "github:srid/haskell-flake/master";
    fourmolu-nix.url = "github:jedimahdi/fourmolu-nix/main";

    git-hooks.url = "github:cachix/git-hooks.nix/master";
    git-hooks.flake = false;
  };

  outputs =
    inputs:
    inputs.nixos-unified.lib.mkFlake {
      inherit inputs;
      root = ./.;
    };
}
