{
  pkgs,
  pkgs-stable,
  lib,
  config,
  ...
}:
let
  cfg = config.hyprland;
in
with lib;
{
  options.hyprland = {
    enable = mkEnableOption "this do what?";

    host = mkOption {
      type = types.string;
      description = "the host";
    };

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

      hjem.users = {
        alex = {
          enable = true;
          user = "alex";
          directory = "/home/alex";

          files = {
            ".config/hypr/common".source = ./hypr/common;
            ".config/tofi".source = ./tofi;
            ".config/quickshell".source = ./quickshell;

          };
        };
      };
    }

    (mkIf cfg.hyprEco {
      environment.systemPackages = with pkgs; [
        hyprshot
        hyprpaper
        hypridle
      ];
    })

    (mkIf cfg.desktopStuff {
      environment.systemPackages =
        (with pkgs; [
          kitty
          playerctl
          tofi
          quickshell
        ])
        ++ (with pkgs-stable; [
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
