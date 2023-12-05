{ config, pkgs, ... }:

{
  imports =
    [ 
      # Hardware config
      ./misc/hardware-configuration.nix
      # Kernel configuration
      ./misc/kernel-configuration.nix
      # Network config
      ./misc/network-configuration.nix
    ];
    
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Hyprland
  programs.hyprland.enable = true;

  # Enable swaylock to unlock session through PAM
  security.pam.services.swaylock = {};

  # Greetd + Tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd  'dbus-run-session Hyprland'";
      };
    };     
  };

  # Podman
  virtualisation = {
    podman = {
      enable = true;
    };
  };

  # Avoid systemd spamming Tuigreet
  systemd.services.greetd = {
    serviceConfig.Type = "idle";
    unitConfig.After = [ "dhcpcd.service" ];
  };
  
  # XDG desktop portal
  xdg = {
    portal.enable = true;  
  };

  # Auto-cpufreq
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = import ./misc/auto-cpufreq.nix;

  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Enable initram
  boot.initrd.systemd.enable = true;

  # Use boot animation
  boot.plymouth.enable = true;
  boot.kernelParams = ["quiet"]; # Remove noise produced by boot log

  # Hostname
  networking.hostName = "emperor"; 

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # System locale and console keymap
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # ZSH
  programs.zsh.enable = true;

  # Create waltz user account
  users.users.waltz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "input" ]; # Enable ‘sudo’ for the user
    shell = pkgs.zsh;
  };

  # LoginD config 
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=hybrid-sleep
    HandleSuspendKey=hybrid-sleep
    HandleHibernateKey=hybrid-sleep

    # Suspend when lid is closed
    HandleLidSwitch=hybrid-sleep

    # Hibernate delay
    HibernateDelaySec=600
  '';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    greetd.greetd
    greetd.tuigreet
  ];

  # Base system version
  system.stateVersion = "24.05"; # Did you read the comment?
}
