{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = with pkgs; [ nixos-generators ];
  #shellHook = ''
  #  export NIXOS="nixos-23.11"
  #'';
}