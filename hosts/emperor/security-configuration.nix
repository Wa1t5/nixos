{ lib, pkgs, ... }:
{
  security = {
    # AppArmor
    apparmor = {
      enable = false;
      killUnconfinedConfinables = false;
    };

    # Enable rtkit
    rtkit.enable = true;

    # KernelProtect (prevent the replacement of an running kernel image)
    # Disabled because it disables hibernation mode
    protectKernelImage = false;
  };

  # Use doas instead of sudo
  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "waltz" ];
    persist = true;
  }];


  environment.shellAliases.sudo = "doas";

  # OpenSnitch
  services.opensnitch = {
    enable = true;
    settings = {
      Firewall = "nftables";
      InterceptUnknown = true;
      DefaultAction = "deny";
      ProcMonitorMethod = "ebpf";
    };
    rules = {
      systemd-timesyncd = {
        name = "systemd-timesyncd";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          sensitive = false;
          operand = "process.path";
          data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-timesyncd";
        };
      };
    };
  };
}
