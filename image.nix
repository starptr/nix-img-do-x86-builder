{ pkgs ? import (builtins.fetchTarball {
  name = "nixos-23.11";
  url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
  sha256 = "1ndiv385w1qyb3b18vw13991fzb9wg4cl21wglk89grsfsnra41k";
}) { } }:
let
  customConfig = import ./configuration-wanted.nix;
  config = {
    imports = [
      <nixpkgs/nixos/modules/virtualisation/digital-ocean-image.nix>
      customConfig
    ];
  };
in
(pkgs.nixos config).digitalOceanImage