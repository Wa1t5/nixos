{ lib, ... }:
{
  # Pipewire
  services.pipewire = lib.mkDefault {
    enable = true;
    #audio.enable = true;
    alsa.enable = false;
    alsa.support32Bit = false;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Pulseaudio
  hardware.pulseaudio.enable = lib.mkForce false;
}
