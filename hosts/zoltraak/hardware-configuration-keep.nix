{ ... }:
{
  hardware.bluetooth.enable = true;

  hardware.amdgpu.initrd.enable = true;
  hardware.cpu.amd.ryzen-smu.enable = true;

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
  };

  boot.initrd.kernelModules = [
    "nvme"
    "sd_mod"
    "xhci_pci"
    "usbhid"
  ];

  # Disable intel ax210 power saving
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
    options iwlmvm power_scheme=1
  '';

  boot.kernelModules = [ "ntsync" ];

  # Enable fstrim
  services.fstrim.enable = true;

  boot.kernelParams = [
    "iommu=pt"
    "amdgpu.runpm=0"
    "amdgpu.aspm=0"
    "pcie_aspm=performance"
  ];

  fileSystems."/media" = {
    device = "/dev/disk/by-uuid/88120a51-8b10-4520-b36d-3c56e75552a8";
    fsType = "ext4";
    options = [
      "x-systemd-automount"
    ];
  };
}
