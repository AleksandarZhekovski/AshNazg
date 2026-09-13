{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.basePkgs = {
    enable = mkEnableOption "some non-essetial packages, that I likly still want on all my systems ";

    light = mkOption {
      type = types.bool;
      default = true;
      description = "small packages and don't need to be build";
    };

    heavy = mkOption {
      type = types.bool;
      default = false;
      description = "large packages, or need to be build";
    };
  };

  config = mkIf config.basePkgs.enable (mkMerge [

    (mkIf config.basePkgs.light {
      environment.systemPackages = with pkgs; [
        btop
        wol
        wakeonlan
        tree
        git
        killall
        curl
        nh
        ncdu
        p7zip
        fastfetch
        pulsemixer
      ];
    })

    (mkIf config.basePkgs.heavy {
      environment.systemPackages = with pkgs; [
        mpv
        pear-desktop
        vesktop
      ];
    })
  ]);
}
