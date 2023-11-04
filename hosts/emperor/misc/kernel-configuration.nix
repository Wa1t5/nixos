{ config, modulesPath, ... }:
{  
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.blacklistedKernelModules = [ "ideapad-laptop" ];
  boot.extraModprobeConfig = ''
      options snd-hda-intel model=alc255-acer,dell-headset-multi
  '';
  boot.extraModulePackages = [ ];

}
