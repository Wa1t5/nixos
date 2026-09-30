{ pkgs, ... }:
{
  # Latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # CachyOS Kernel
  #boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;

  boot.kernelParams = [ "systemd.swap=0" ];

  # Enable ZRam
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 100;
    memoryPercent = 100;
    writebackDevice = "/dev/disk/by-uuid/3f4885f8-ea81-474c-b121-f4a8264407f4";

  };
}
