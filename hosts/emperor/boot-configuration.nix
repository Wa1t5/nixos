{ ... }:
{
  boot = {
    # Enable bootspec (Required by lanzaboote)
    bootspec.enable = true;

    # Enable lanzaboote (Secure boot)
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = false; # disable systemd-boot and replace with lanzaboote
    loader.efi.canTouchEfiVariables = true;
  
    # Enable initram
    initrd.systemd.enable = true;

    # Use boot animation
    plymouth.enable = true;

    # Silent boot
    kernelParams = [ 
      "quiet"
      "udev.log_level=3"
      "nowatchdog"
    ]; 
    initrd.verbose = 0;
    consoleLogLevel = 0;

    # Disable systemd boot editor as it can lead to root access on boot
    loader.systemd-boot.editor = false;
  
    # Clean /tmp after reboot
    tmp.cleanOnBoot = true;

    # Mount /tmp on RAM
    tmp.useTmpfs = true; # disable when building large packages
    tmp.tmpfsSize = "70%";

  };
}
