{ ... }:
{
  imports = [
    ./audio-configuration.nix
    ./boot-configuration.nix
    ./configuration.nix
    ./firewall-configuration.nix
    ./graphics-configuration.nix
    ./kernel-configuration.nix
    ./network-configuration.nix
    ./wireguard.nix
    ./security-configuration.nix
    ./session-manager-configuration.nix
    ./inputs-configuration.nix
    ./users.nix
    ./fontconfig.nix
    ./virtualisation.nix
    ./services.nix
    ./sops.nix
    ./misc
  ];
}
