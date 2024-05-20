{ pkgs ? import (builtins.fetchTarball {
  name = "nixos-23.11";
  url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
  sha256 = "1ndiv385w1qyb3b18vw13991fzb9wg4cl21wglk89grsfsnra41k";
}) { } }:
let config = {
  imports = [ <nixpkgs/nixos/modules/virtualisation/digital-ocean-image.nix> ];

  configuration = {
    system.stateVersion = "23.11";

    swapDevices = [
      {
        device = "/swapfile";
        size = 3072;
      }
    ];

    users.mutableUsers = false;
    users.users.yuto = {
      isNormalUser = true;
      shell = pkgs.bash;
      description = "Yuto";
      password = "";
      createHome = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        # Add login public key or leave blank to fill via DO later
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtVvX9uhSWD1DPBIRqgkNzFXqjdqvWB/WtDy4seaiJl"
      ];
    };
  };
};
in
(pkgs.nixos config).digitalOceanImage