{ ... }: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    hardwareAcceleration = {
      enable = true;
      device = "/dev/dri/renderD128";
      type = "vaapi";
    };

    transcoding = {
      enableHardwareEncoding = true;
    };
  };

  users.users.jellyfin.extraGroups = [
    "media"
    "video"
    "render"
  ];

  systemd.services.jellyfin.environment = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
