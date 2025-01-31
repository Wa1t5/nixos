{ lib, ... }:
{
  # Pipewire
  services.pipewire = lib.mkForce {
    enable = true;
    #audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = false;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Pulseaudio
  #hardware.pulseaudio.enable = lib.mkForce false;
}
