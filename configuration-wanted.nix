{ modulesPath, lib, pkgs, ... }:
{
  #imports = [ ];
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
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLrT2/gQXhOz4E4xSphB8EXouild5qNOnZ6ZVXuTnf167z8xxSB10mxNey2gKDaIVig6I/tRFeYy6/N/QutbBlKI/+GNPjGCcVJI0hf7fTZGL4caTW8ggcXRz4LAsFp3JBf6Li0FVrGz5ojD0Etbl54BDn033q/tlVRhme5bXJ6s73yRg04kqdQsWVBRJwyzbUUmCQPrZd9i5Nh4QFVuhZljEyUWIStajE+c9v8OOiY1svv+XjKBjyWphP16HqgzvnEDf5+MQ5AUxE05IvJx43UY43CKTe3evzt4F/IqSdYwYGIQ55DaseRmf5zmHLU8MTTkksmOPQEzJL0nBzAmxyGV3PsMYPoIN+1/gJmxCO6ZaaCxYr9SFK/yoRW5e0PFX433xPhNsITBq7jUrVg6BQ/lr0ntRfvd7pRhFq8v02R3jWokL/99skxp1kjVF42bXEJXYPpHF3XAUhYscjOwmWj8dJgsIsSIKIjh7gRVYxQGrZQXOcJQjMytFgXy7fWHM= yuto@Yutos-MacBook-Pro.local" # Yuto's Sodium
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtVvX9uhSWD1DPBIRqgkNzFXqjdqvWB/WtDy4seaiJl" # 1Password "ssh key - main"
    ];
  };
}