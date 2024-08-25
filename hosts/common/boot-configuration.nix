{ ... }:
{
  boot = {
    # Enable initram
    initrd.systemd.enable = true;

    # Use boot animation
    #plymouth.enable = true;

    # Silent boot
    #kernelParams = [ 
    #  "quiet"
    #  "udev.log_level=3"
    #  "nowatchdog"
    #]; 
    #initrd.verbose = 0;
    #consoleLogLevel = 0;

    # Disable systemd boot editor as it can lead to root access on boot
    loader.systemd-boot.editor = false;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Clean /tmp after reboot
    tmp.cleanOnBoot = true;

    # Mount /tmp on RAM
    tmp.useTmpfs = false; # disable when building large packages
    tmp.tmpfsSize = "70%";
  };
}
