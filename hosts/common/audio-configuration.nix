{ lib, ... }:
{
  # Pipewire
  services.pipewire = lib.mkForce {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = false;
    pulse.enable = true;
    jack.enable = false;
    wireplumber.enable = true;
    extraConfig.pipewire = {
      "99-clock-rate" = {
        "context.properties" = {
          "default.clock.allowed-rates" = [
            44100
            48000
            88200
            96000
            176400
            192000
            352800
            384000
          ];
        };
      };
    };
    wireplumber.extraConfig = {
      "51-no-suspend" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              { "node.name" = "~alsa_input\\..*"; }
              { "node.name" = "~alsa_output\\..*"; }
            ];
            actions.update-props = {
              "session.suspend-timeout-seconds" = 0;
            };
          }
        ];
        "monitor.bluez.rules" = [
          {
            matches = [
              { "node.name" = "~bluez_input\\..*"; }
              { "node.name" = "~bluez_output\\..*"; }
            ];
            actions.update-props = {
              "session.suspend-timeout-seconds" = 0;
            };
          }
        ];
      };
      "fiio-ka11" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                "node.name" = "~alsa_output\\..*KA11*";
              }
            ];
            actions = {
              update-props = {
                "audio.format" = "S32LE";
                "audio.allowed-rates" = "44100,48000,88200,96000,176400,192000,352800,384000";
                "api.alsa.period-size" = 128;
                "api.alsa.headroom" = 128;
              };
            };
          }
        ];
      };
    };
  };
}
