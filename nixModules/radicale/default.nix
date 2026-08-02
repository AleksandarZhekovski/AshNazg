{
  lib,
  config,
  ...
}:
let
  cfg = config.radicale; # define optoin a
in
with lib;
{
  options.radicale = {
    # this is the option
    enable = mkEnableOption "Enable radicle server?"; # enable is prety much mandatory

  };
  config = mkIf cfg.enable (mkMerge [
    {
      networking.firewall.allowedTCPPorts = [ 5232 ];
      networking.firewall.allowedUDPPorts = [ 5232 ];
      services.radicale = {
        enable = true;
        settings = {
          server.hosts = [ "0.0.0.0:5232" ];
          auth.type = "none";
        };
      };
    }
  ]);
}
