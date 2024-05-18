# nix-img-do-x86 builder

This creates a NixOS image for x86_64 DO droplets.

## Usage

```bash
nix-build image.nix
```
will produce a `result/` symlink containing the image.

## Builds
A prebuilt 23.11 image is [available](https://cf-ipfs.com/ipfs/QmUtF6u4TDZCXVVrk16VDw5Ag2iHhrwVV27EJ461TGcWun?filename=nixos-23.11-x86_64.qcow2.gz).