{ ... }:
{
  hardware.bluetooth.enable = true;

  # Disable intel ax210 power saving
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
    options iwlmvm power_scheme=1
    options iwlwifi disable_aspm_l1ss=y
  '';

  fileSystems."/media/games" = {
    device = "/dev/disk/by-uuid/7C5A8BB14378E513";
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
