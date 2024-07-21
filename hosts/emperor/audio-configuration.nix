{ ... }:
{
  # Pipewire
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Wireplumber (remove this when I migrate it to nixos-hardware)
  services.pipewire.wireplumber.extraConfig = {
    "monitor.alsa.rules" = {
      matches = [
        { "node.name" = "*"; }
        #{ "device.name" = "~alsa_card.*"; }
        #{ "node.name" = "~alsa_input.*"; }
        #{ "node.name" = " ~alsa_output.*"; }
      ];
      actions = {
        update-props = { "session.suspend-timeout-seconds" = 0; };
      };
    };
  };
}
