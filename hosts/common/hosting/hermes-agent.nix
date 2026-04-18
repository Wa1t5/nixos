{ inputs, config, ... }:
{
  imports = [
    inputs.hermes-agent.nixosModules.default
  ];

  services.hermes-agent = {
    enable = true;
    addToSystemPackages = true;
    #container.enable = true;

    environmentFiles = [ "/run/secrets/hermes-env" ];

    settings = {
      model = {
        base_url = "http://localhost:11434/v1";
        default = "qwen3.5:0.8b";
        provider = "custom";
      };
    };
  };
}
