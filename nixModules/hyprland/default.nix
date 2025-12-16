{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}: let
  cfg = config.hyprland;
in
  with lib; {
    options.hyprland = {
      enable = mkEnableOption "this do what?";

      hyprEco = mkOption {
        type = types.bool;
        default = true;
        description = "hypr* eco system";
      };

      desktopStuff = mkOption {
        type = types.bool;
        default = true;
        description = "Firefox, kitty, playerctl, etc...";
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

      (mkIf cfg.desktopStuff {
        environment.systemPackages =
          (with pkgs; [
            kitty
            playerctl
            tofi
          ])
          ++ (with pkgs-unstable; [
            quickshell
          ]);

        programs = {
          firefox.enable = true;
          yazi.enable = true;
        };

        fonts.packages = with pkgs; [
          nerd-fonts.hack
        ];
      })
    ]);
  }
