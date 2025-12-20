{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
let
  cfg = config.mc-server;
in
with lib;
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  options.mc-server = {
    enable = mkEnableOption "Minecraft server";
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;

      servers = {
        TheShire = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_11;

          autoStart = false;

          serverProperties = {
            server-port = 25565;
            max-players = 10;
            motd = "The Shire minecraft server";
            jvmOpts = "-XmxG -Xms2G";

          };
        };
      };

    };
  };
}
