{ ... }:
{
  security = {
    # AppArmor
    apparmor = {
      enable = true;
      killUnconfinedConfinables = false;
    };

    # Enable rtkit
    rtkit.enable = true;

    # KernelProtect (prevent the replacement of an running kernel image)
    # Disabled because it disables hibernation mode
    protectKernelImage = false;
  };

  # Force dbus service to use apparmor
  services.dbus.apparmor = "disabled";


}
