{ sops, ... }:
{
  sops = {
    # Load private keys
    defaultSopsFile = "/etc/nixos/secrets/secrets.yaml";
    validateSopsFiles = false;
    age.sshKeyPaths = [ "/home/waltz/.ssh/sops_id_ed25519" ];
  };
}
