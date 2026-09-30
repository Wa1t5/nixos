{ ... }:
{
  hardware.bluetooth.enable = true;

  hardware.cpu.amd.ryzen-smu.enable = true;

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
  };

  boot.initrd.kernelModules = [
    "nvme"
    #    "ahci"
    "sd_mod"
    "xhci_pci"
    "usbhid"
  ];

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
    # "nvme_core.default_ps_max_latency_us=0"
    # "tpm.interrupts=0"
    # "initcall_blacklist=tpm_tis_init"
    # "modprobe.blacklist=tpm_tis,tpm_tis_core,tpm"
  ];

  fileSystems."/media/data" = {
    device = "/dev/disk/by-uuid/4C8C852E8C85139C";
    fsType = "ntfs3";
    options = [
      "x-systemd.automount"
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
      "force"
    ];
  };

  fileSystems."/media/data2" = {
    device = "/dev/disk/by-uuid/4468B72568B71520";
    fsType = "ntfs3";
    options = [
      "x-systemd.automount"
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
      "force"
    ];
  };
}
