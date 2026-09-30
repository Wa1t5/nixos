{ ... }:
{
  hardware = {
    # Enable uinput
    uinput.enable = true;

    opentabletdriver = {
      enable = false;
      daemon.enable = true;
    };
  };
}
