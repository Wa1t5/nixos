{ ... }:
{
  services.ollama = {
    enable = true;
    #acceleration = "rocm";
    #environmentVariables = {
    #  HCC_AMDGPU_TARGET = "gfx902";
    #};
    #rocmOverrideGfx = "9.0.2";
  };
}
