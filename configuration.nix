{ config, pkgs, ... }:

{
  imports =
    [ 
      # Hardware config
      ./misc/hardware-configuration.nix
      # Newtork config
      ./misc/network-configuration.nix
    ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hyprland
  programs.hyprland.enable = true;
  programs.light.enable = true;

  # Greetd + Tuigreet
  services.greetd = {
      enable = true;
      settings = {
          default_session = {
              command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd Hyprland";
          };
      };     
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
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    dhcpcd
    nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    greetd.greetd
    greetd.tuigreet
  ];

  # Base system version
  system.stateVersion = "23.05"; # Did you read the comment?

}

