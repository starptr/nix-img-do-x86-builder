{ pkgs ? import <nixpkgs> { } }:
let config = {
  imports = [ <nixpkgs/nixos/modules/virtualisation/digital-ocean-image.nix> ];

  # system.stateVersion = "24.05";

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
in
(pkgs.nixos config).digitalOceanImage