{
  osConfig,
  config,
  inputs,
  ...
}:
{
  imports = [ inputs.noctalia-greeter.nixosModules.default ];

  services.displayManager.noctalia-greeter = {
    enable = config.wm.umbriel.enable;
  };
}
