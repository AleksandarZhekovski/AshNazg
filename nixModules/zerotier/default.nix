{
  lib,
  config,
  ...
}: let
  cfg = config.zerotier;
in
  with lib; {
    options.zerotier = {
      enable = mkEnableOption "Connect to Zerotier";
    };

    config = mkIf cfg.enable {
      services.zerotierone = {
        enable = true;
        joinNetworks = ["363c67c55a84e9d4"];
      };
    };
  }
