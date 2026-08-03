{ ... }:
{
  services.unbound = {
    enable = true;
    settings = {
      server = {
        port = 5335;
        interface = [
          "::1"
          "127.0.0.1"
        ];

        do-ip4 = true;
        do-ip6 = true;

        access-control = [
          "127.0.0.0/8 allow"
          "::1/128 allow"
        ];

        cache-min-ttl = 300;
        cache-max-ttl = 86400;

        msg-cache-size = "64m";
        rrset-cache-size = "128m";

        num-threads = 2;

        prefetch = true;
        prefetch-key = true;

        auto-trust-anchor-file = "/var/lib/unbound/root.key";
        harden-dnssec-stripped = true;
        harden-referral-path = true;
        qname-minimisation = true;

        edns-buffer-size = 1232;
        infra-cache-numhosts = 10000;

        so-reuseport = true;

        #root-hints = "/var/lib/unbound/root.hints";

        verbosity = 0;
      };
    };

  };
}
