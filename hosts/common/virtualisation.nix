{ pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        # Enable TPM emulation
        swtpm.enable = true;
      };
    };
  };

}
