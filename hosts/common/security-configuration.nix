{ ... }: {
  security = {
    # Kwallet
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };

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
}
