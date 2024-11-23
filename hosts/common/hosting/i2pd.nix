{ ... }:
{
  services.i2pd = {
    enable = false;
    address = "127.0.0.1";
    proto = {
      sam.enable = true;
      http.enable = true;
      socksProxy.enable = true;
      httpProxy.enable = true;
    };
  };
}
