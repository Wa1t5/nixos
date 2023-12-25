{ ... }:
{    
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Enable initram
  boot.initrd.systemd.enable = true;

  # Use boot animation
  boot.plymouth.enable = true;
  boot.kernelParams = [ "quiet" ]; # Remove noise produced by boot log
}
