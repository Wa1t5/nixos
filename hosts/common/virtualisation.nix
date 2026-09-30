{ pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = false;
      qemu = {
        # Enable TPM emulation
        swtpm.enable = true;
      };
    };
  };

}
