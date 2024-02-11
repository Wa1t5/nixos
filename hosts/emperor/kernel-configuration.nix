{ pkgs, ... }:
{  
#boot.kernelPackages = let
#  linux_zen_pkg = { fetchurl, buildLinux, ... }@args:

#    buildLinux (args // rec {
#      version = "6.7.4-zen1";
      
#      modDirVersion = version;

#      src = fetchurl {
#        url = "https://github.com/zen-kernel/zen-kernel/archive/v6.7.4-zen1.tar.gz";
#        sha256 = "sha256-xOcCrXy1NB+KZWPc/CThfYlS383HnU9Gfso5juC+nUc=";
#      };
#      extraMeta.branch = "6.7";
      
#      kernelPatches = [];
      
#    } // (args.argsOverride or { }));
#  linux_zen = pkgs.callPackage linux_zen_pkg { };
#  in pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_zen); 

  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages-rt_latest;

  # Kernel params
  boot.kernelParams = [ "nowatchdog" ];
  
  # Kernel modules available on initram
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "cryptd" "aesni_intel" ];

  # Kernel modules to force load on iniram
  boot.initrd.kernelModules = [ ];

  # Kernel modules to force load
  boot.kernelModules = [ "kvm-amd" ];

  # Blocked kernel modules
  boot.blacklistedKernelModules = [ "uvcvideo"  "sp5100_tco" ];

  # Enable resuming from hibernate
  boot.resumeDevice = "/dev/disk/by-uuid/764cfc2a-8549-497a-aaa3-9f238f652945";

  # Clean /tmp after reboot
  boot.tmp.cleanOnBoot = true;

  # Mount /tmp on RAM
  boot.tmp.useTmpfs = true;

  # Enable ZRam
  zramSwap = {
    enable = true;
    algorithm = "lz4";
  };
}
