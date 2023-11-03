{ config, libs, ...  }:
{
    networking = {
        useDHCP = true;
        interfaces.wlp1s0.useDHCP = true;
        wireless = {
            enable = true;
            networks = {
                "SO JESUS" = {
                    pskRaw = "fbed1bf8aafb9da805a70449bd03a8f790b7d4cfbb7b0d903d2f5b120cbf0f59";
                };
            };
        };
    };
}
