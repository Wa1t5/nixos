{  ... }: 
{
  # Enable some 32bit libraries for gpu accel
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
