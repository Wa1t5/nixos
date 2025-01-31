{ ... }:
{
  # Nix Options
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
      "auto-allocate-uids"
      "ca-derivations"
      "cgroups"
      "dynamic-derivations"
      #"git-hashing"
      "no-url-literals"
      #"verified-fetches"
    ];
    auto-optimise-store = true;

    trusted-users = [ "waltz" ];
  };

  nix = {
    # Use Latest nix package
    #package = pkgs.nixVersions.nix_2_23;

    # Nix-store optimiser
    optimise = {
      dates = [ "19:00" "00:00" "13:00" ];
      automatic = true;
    };

    # Nix garbage collector
    gc = {
      randomizedDelaySec = "1h";
      dates = "weekly";
      automatic = true;
    };

    # Avoid system slowdowns by lowering nix-daemon priority
    daemonIOSchedClass = "idle";
    daemonCPUSchedPolicy = "idle";
  };

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # System locale and console keymap
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LANGUAGE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Base system version
  system.stateVersion = "24.11";
}
