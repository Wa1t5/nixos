{ config, lib, ... }:
{
  # Auto-cpufreq
  services.auto-cpufreq.enable = config.networking.hostName == "zoltraak";
  services.auto-cpufreq.settings = {
    battery = {
      #governor = "powersave";
      turbo = "never";
    };
    charger = {
      #governor = "powersave";
      turbo = "never";
    };
  };
}
