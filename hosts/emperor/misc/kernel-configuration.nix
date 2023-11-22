{ config, modulesPath, ... }:
{  
  # Kernel modules available on initram
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "cryptd" "aesni_intel" ];

  # Kernel modules to force load on iniram
  boot.initrd.kernelModules = [ ];

  # Kernel modules to force load
  boot.kernelModules = [ "kvm-amd" ];

  # Blocked kernel modules
  boot.blacklistedKernelModules = [ "ideapad-laptop" "uvcvideo" ];

  # Kernel module config
  boot.extraModprobeConfig = ''
      options snd-hda-intel model=alc255-acer,dell-headset-multi
  '';
  boot.extraModulePackages = [ ];

}
