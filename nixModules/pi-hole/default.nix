{
  lib,
  config,
  ...
}:
with lib;
{
  options.pi-hole = {
    # this is the option
    enable = mkEnableOption "this do what?"; # enable is prety much mandatory

    # b = mkOption {
    #   # some suboption
    #   type = types.string;
    #   description = "the host";
    # };
    #
    # c = mkOption {
    #   # some suboption
    #   type = types.string;
    #   description = "the host";
    # };
  };

  config = mkIf config.pi-hole.enable (mkMerge [
    # if enable is on
    {
      # always of if enabled

      services.pihole-ftl = {
        enable = true;
        settings = {
          # See <https://docs.pi-hole.net/ftldns/configfile/>

          # External DNS Servers quad9 and cloudflare
          dns.upstreams = [
            "9.9.9.9"
            "1.1.1.1"
          ];

          # Optionally resolve local hosts (domain is optional)
          # dns.hosts = [ "192.168.1.188 hostname.domain" ];
        };

        lists = [
          # Lists can be added via URL
          {
            url = "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt";
            type = "block";
            enabled = true;
            description = "hagezi blocklist";
          }
        ];
      };

      services.pihole-web = {
        enable = true;
        ports = [ "443" ];
      };

    }

    # (mkIf cfg.b {
    #   # if be is enabled
    # })
    #
    # (mkIf cfg.c {
    #   # if c is enabled
    # })
  ]);
}
