{ pkgs, ... }:
{  
  # Latest kernel
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  # Latest realtime kernel
  # boot.kernelPackages = pkgs.linuxPackages-rt_latest;

  # CachyOS kernel
  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;

  # Kernel modules available on initra
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "cryptd" "aesni_intel" ];

  # Kernel modules to force load on iniram
  boot.initrd.kernelModules = [ ];

  # Kernel modules to force load
  boot.kernelModules = [ "kvm-amd" ];

  # Blocked kernel modules
  boot.blacklistedKernelModules = [ "uvcvideo"  "sp5100_tco" ];

  # Enable resuming from hibernate
  boot.resumeDevice = "/dev/disk/by-uuid/764cfc2a-8549-497a-aaa3-9f238f652945";

  # Enable ZRam
  zramSwap = {
    enable = true;
    algorithm = "lz4";
  };
}
