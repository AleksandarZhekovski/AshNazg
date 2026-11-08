{
  lib,
  config,
  ...
}:
with lib; {
  options.zerotier = {
    enable = mkEnableOption "Connect to Zerotier";
  };

  config = mkIf config.zerotier.enable {
    services.zerotierone = {
      enable = true;
      joinNetworks = [
        # "363c67c55a84e9d4" # mammaaa
        "65228d8d6de05747" # IronHarts
      ];
    };
  };
}
