{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      #intel-compute-runtime
      #intel-media-sdk
      #vpl-gpu-rt
      libva-vdpau-driver
      intel-vaapi-driver
    ];
  };

  hardware.enableRedistributableFirmware = true;

  boot.kernelParams = [ "i915.enable_guc=2" ];

  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  #nixpkgs.config.permittedInsecurePackages = [
  #  "intel-media-sdk-23.2.2"
  #];
}
