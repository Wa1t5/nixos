{ ... }:
{
    # Auto-cpufreq
    services.auto-cpufreq.enable = false;
    services.auto-cpufreq.settings = {
        battery = {
            governor = "powersave";
            turbo = "never";
        };
        charger = {
            governor = "powersave";
            turbo = "never";
        };
    };
}
