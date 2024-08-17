{ pkgs, ... }:
{
  # Latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Latest realtime kernel
  # boot.kernelPackages = pkgs.linuxPackages-rt_latest;

  # Kernel modules available on initra
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "cryptd" "aesni_intel" ];

  # Kernel modules to force load on iniram
  boot.initrd.kernelModules = [ ];

  # Kernel modules to force load
  boot.kernelModules = [ "kvm-amd" ];

  # Blocked kernel modules
  boot.blacklistedKernelModules = [ "uvcvideo" ];

  # Enable ZRam
  zramSwap = {
    enable = true;
    algorithm = "lz4";
  };
}
