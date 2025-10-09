{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.hyprland;
in with lib;{
  options.hyprland = {
    enable = mkEnableOption "this do what?";
    hyprEco= mkOption {
      type = types.bool;
      default = true;
      description = "hypr* eco system";
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      programs.hyprland.enable = true;
    }

    (mkIf cfg.hyprEco {
      environment.systemPackages = with pkgs; [
      hyprshot
      hyprpaper
      ];
    })
  ]);
}
