{ modulesPath, lib, pkgs, ... }:
{
  imports = [ ];
  #imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
  #  (modulesPath + "/virtualisation/digital-ocean-config.nix")
  #];

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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtVvX9uhSWD1DPBIRqgkNzFXqjdqvWB/WtDy4seaiJl"
    ];
  };
}