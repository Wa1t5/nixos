{ pkgs, ... }:
{
  # Latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # CachyOS Kernel
  #boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;

  # Latest realtime kernel
  # boot.kernelPackages = pkgs.linuxPackages-rt_latest;

  # Kernel modules available on initramfs
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "usb_storage"
    "sd_mod"
    "cryptd"
    "aesni_intel"
  ];

  # Kernel modules to force load on initramfs
  boot.initrd.kernelModules = [ ];

  # Kernel modules to force load
  boot.kernelModules = [ "kvm-amd" ];

  # Blocked kernel modules
  boot.blacklistedKernelModules = [ "uvcvideo" ];

  # Enable ZRam
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 100;
  };
}
