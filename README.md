# nix-img-do-x86 builder

This creates a NixOS image for x86_64 DO droplets.

## Usage
```bash
nix develop
```
adds `nixos-generate` to path. Then, run

```bash
nixos-generate -f do -c configuration-wanted.nix
```
to generate an image for digital ocean with the specified configuration.
- TODO: figure out where in the image the custom configuration is stored.

As a sanity check, run `htop` via `nix-shell -p htop` in a container created from the image to verify that the custom configuration is present (3GB of swap).

## Usage
- This method has not been checked to see whether the custom configuration is present in the image.
    - TODO: try the same sanity check above

```bash
nix-build image.nix
```
will produce a `result/` symlink containing the image.

### Builds
A prebuilt 23.11 image is [available](https://cf-ipfs.com/ipfs/QmUtF6u4TDZCXVVrk16VDw5Ag2iHhrwVV27EJ461TGcWun?filename=nixos-23.11-x86_64.qcow2.gz).