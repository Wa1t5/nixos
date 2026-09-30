{ ... }:
{
  boot = {
    # Enable initrd
    initrd = {
      systemd.enable = true;
      compressor = "zstd";
    };

    loader = {
      # Disable systemd boot editor as it can lead to root access on boot
      systemd-boot.editor = false;
      systemd-boot.enable = true;
      timeout = 0;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;

      # Limine bootloader
      limine.enable = false;

    };

    # Clean /tmp after reboot
    tmp.cleanOnBoot = true;

    # Mount /tmp on RAM
    tmp.useTmpfs = true; # disable when building large packages
    tmp.tmpfsSize = "50%";
  };

  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
}
