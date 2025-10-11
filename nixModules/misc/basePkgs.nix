{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.basePkgs;
in {
  options.basePkgs = {
    enable = lib.mkEnableOption "this do what?";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      btop
      wol
      tree
      git
      killall
      curl
      nano
    ];
  };
}
