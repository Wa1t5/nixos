{ ... }:
{
  services.tlp = {
    enable = true;
    settings = {

      ### CPU
      #CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      #CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 20;

      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      ### AMDGPU
      RADEON_DPM_PERF_LEVEL_ON_AC = "high";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "high";

      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "performance";

      RADEON_POWER_PROFILE_ON_AC = "high";
      RADEON_POWER_PROFILE_ON_BAT = "high";

      ### Audio
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 0;

      SOUND_POWER_SAVE_CONTROLLER = "N";

      ### Battery
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      ### Disk
      #DISK_DEVICES = "sda";

      #DISK_APM_LEVEL_ON_AC = "128 128";
      #DISK_APM_LEVEL_ON_BAT = "128 128";

      #DISK_SPINDOWN_TIMEOUT_ON_AC = "0 0";
      #DISK_SPINDOWN_TIMEOUT_ON_BAT = "0 0";

      #DISK_IOSCHED = "mq-deadline mq-deadline";

      #SATA_LINKPWR_ON_AC = "med_power_with_dipm";
      #SATA_LINKPWR_ON_BAT = "med_power_with_dipm";

      ### Filesystem
      DISK_IDLE_SECS_ON_AC = 0;
      DISK_IDLE_SECS_ON_BAT = 0;

      ### Kernel
      NMI_WATCHDOG = 0;

      ### Networking
      WIFI_PWR_ON_AC = "on";
      WIFI_PWR_ON_BAT = "on";

      WOL_DISABLE = "y";

      # Platform
      PLATFORM_PROFILE_ON_AC = "cool";
      PLATFORM_PROFILE_ON_BAT = "cool";

      MEM_SLEEP_ON_AC = "deep";
      MEM_SLEEP_ON_BAT = "deep";
    };
  };
}
