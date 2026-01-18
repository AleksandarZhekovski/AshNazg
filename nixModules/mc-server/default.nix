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

      dataDir = "/srv/real";

      servers = {
        TheShire = {
          enable = true;
          package = pkgs.minecraftServers.vanilla-1_21_11;

          autoStart = true;

          serverProperties = {
            server-port = 25565;
            max-players = 10;
            motd = "The Shire minecraft server";
            jvmOpts = "-XmxG -Xms5G";
            difficulty = 3;
            online-mode=false;
            enforce-secure-profile=false;
            view-distance=16;
            simulation-distance=12;
          };
        };
      };

    };
  };
}
