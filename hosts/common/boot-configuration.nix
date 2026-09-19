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

    loader = {
      # Disable systemd boot editor as it can lead to root access on boot
      systemd-boot.editor = false;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;

      # Limine bootloader
      limine.enable = false;

    };

    # Clean /tmp after reboot
    tmp.cleanOnBoot = true;

    # Mount /tmp on RAM
    tmp.useTmpfs = true; # disable when building large packages
    tmp.tmpfsSize = "50%";
  };
}
