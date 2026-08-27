{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.basePkgs;
in
{
  options.basePkgs = {
    enable = lib.mkEnableOption "some non-essetial packages, that I likly still want on all my systems ";
  };

  config = lib.mkIf cfg.enable {
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
    ];
  };
}
