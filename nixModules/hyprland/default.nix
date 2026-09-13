{
  pkgs,
  pkgs-stable,
  lib,
  config,
  ...
}:
with lib;
{
  options.hyprland = {
    enable = mkEnableOption "this do what?";

    host = mkOption {
      type = types.str;
      description = "the host";
    };

    auxiliaries = mkOption {
      type = types.bool;
      default = true;
      description = "quckshell, tofi, kitty, playerctl, etc...";
    };

    hyprEco = mkOption {
      type = types.bool;
      default = true;
      description = "hypr* eco system";
    };

    desktopPrograms = mkOption {
      type = types.bool;
      default = true;
      description = "Firefox, yazi...";
    };

  };

  config = mkIf config.hyprland.enable (mkMerge [
    {
      programs.hyprland = {
        enable = true;
        withUWSM = true;
      };
      environment.systemPackages = with pkgs; [
      ];

      hjem.users.alex.files = {
        ".config/hypr/hyprland.lua".source = ../../nixModules/hyprland/hypr/${config.hyprland.host}.lua;
        ".config/hypr/common".source = ./hypr/common;
      };
    }

    (mkIf config.hyprland.auxiliaries {
      environment.systemPackages =
        (with pkgs; [
          kitty
          playerctl
          tofi
          quickshell
        ])
        ++ (with pkgs-stable; [
        ]);

      hjem.users.alex.files = {
        ".config/tofi".source = ./tofi;
        ".config/quickshell".source = ./quickshell;
      };

      fonts.packages = with pkgs; [
        nerd-fonts.hack
      ];
    })

    (mkIf config.hyprland.hyprEco {
      environment.systemPackages = with pkgs; [
        hyprpaper
        hypridle
        hyprlock
        hyprshot
      ];
      hjem.users.alex.files = {
        ".config/hypr/hyprpaper.conf".source = ./hypr/ecosystem/hyprpaper.conf;
        ".config/hypr/hypridle.conf".source = ./hypr/ecosystem/hypridle.conf;
        ".config/hypr/wallpapers/wallpaper.png".source = ./hypr/wallpapers/wallpaper.png;
      };
    })

    (mkIf config.hyprland.desktopPrograms {
      programs = {
        firefox.enable = true;
        yazi.enable = true;
      };

      environment.systemPackages =
        (with pkgs; [
        ])
        ++ (with pkgs-stable; [
        ]);
    })
  ]);
}
