{ pkgs ? import <nixpkgs> {} }:

let
  env = (pkgs.haskellPackages.callCabal2nix "minigrace" ./. { }).env;
in

  pkgs.lib.overrideDerivation env (old: {
    buildInputs = old.buildInputs ++ [
      pkgs.haskellPackages.ghcid
      pkgs.haskellPackages.hlint
    ];
  })
