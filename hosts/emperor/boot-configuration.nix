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
    kernelParams = [ "quiet" ]; # Remove noise produced by boot log
  };
}
