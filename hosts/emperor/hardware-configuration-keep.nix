{ ... }:
{
  hardware.bluetooth.enable = true;
  
  fileSystems."/media/games" = 
  { device = "/dev/disk/by-uuid/7C5A8BB14378E513";
    fsType = "ntfs3";
    options = [ "uid=1000" "gid=1000" "rw" "user" "exec" "nofail" "umask=000" ];
  };
}
