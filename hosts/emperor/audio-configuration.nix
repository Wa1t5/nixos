{ ... }:
{
  # Pipewire
  services.pipewire = {
    enable = true;
    #audio.enable = true;
    alsa.enable = false;
    alsa.support32Bit = false;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
}
