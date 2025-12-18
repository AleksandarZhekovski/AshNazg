{
  lib,
  config,
  ...
}:
let
  cfg = config.minecraft-server;
in
with lib;
{
  options.minecraft-server = {
    enable = mkEnableOption "Minecraft server";
  };

  config = mkIf cfg.enable {

  };
}
