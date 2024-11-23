{ pkgs ? import <nixpkgs> {} }:
let
  unstable = import <nixos-unstable> {};
in
pkgs.mkShell {
  nativeBuildInputs = [
    unstable.btop
    unstable.neovim
  ];
}
