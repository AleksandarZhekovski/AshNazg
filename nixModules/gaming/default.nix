{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.gaming;
in
  with lib; {
    options.gaming = {
      enable = mkEnableOption "You should focus on uni";

      steam = mkOption {
        type = types.bool;
        default = false;
        description = "Steam and proton tricks";
      };

      lutris = mkOption {
        type = types.bool;
        default = false;
        description = "Lutris";
      };
    };

    config = mkIf cfg.enable (mkMerge [
      {
      }

      (mkIf cfg.steam {
        programs.steam.enable = true;
      })

      (mkIf cfg.lutris {
        environment.systemPackages = with pkgs; [
          lutris
        ];
      })
    ]);
  }
