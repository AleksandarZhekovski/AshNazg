{
  lib,
  config,
  ...
}:
let
  cfg = config.tailscale;
in
with lib;
{
  options.tailscale = {
    enable = mkEnableOption "Tailscale survice";

    autoconnect = mkOption {
      type = type.bool;
      default = false;
      description = "hopefully autoconnects";
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      services.tailscale = {
        # Enable tailscale at startup
        enable = true;

        # If you would like to use a preauthorized key, set
        # authKeyFile = "/run/secrets/tailscale_key";
        # Note: maximum expire time is 90 days
      };
    }

    (mkIf cfg.autoconnect {
      # if be is enabled
    })
  ]);
}
