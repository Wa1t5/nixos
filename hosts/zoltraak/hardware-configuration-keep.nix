{ ... }:
{
  hardware.bluetooth.enable = true;

  hardware.cpu.amd.ryzen-smu.enable = true;

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
  };

  # Disable intel ax210 power saving
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
    options iwlmvm power_scheme=1
    options iwlwifi disable_aspm_l1ss=y
  '';

  # Enable fstrim
  services.fstrim.enable = true;

  boot.kernelParams = [
    "iommu=pt"
    "amdgpu.runpm=0"
    "amdgpu.aspm=0"
    "pcie_aspm=performance"
  ];

  fileSystems."/media/data" = {
    device = "/dev/disk/by-uuid/4C8C852E8C85139C";
    fsType = "ntfs3";
    options = [
      "uid=1000"
      "gid=1000"
      "rw"
      "user"
      "exec"
      "nofail"
      "umask=000"
      "prealloc"
      "noatime"
      "nocase"
      "windows_names"
    ];
  };
}
