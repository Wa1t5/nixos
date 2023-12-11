{ ... }:
let 
  musnix = builtins.fetchGit {
    url = "https://github.com/musnix/musnix.git";
    rev = "25cdc3040563fedacacddad0bc05d8f0e3a4a02f";
  };
in {
  imports = [
    "${musnix}/modules/base.nix"
  ];
  
  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Musnix
  musnix = {
    enable = true;
    soundcardPciId = "02:00.6";
  };
 }
