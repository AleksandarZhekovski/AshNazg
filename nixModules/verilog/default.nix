{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.verilog;
in
  with lib; {
    options.verilog = {
      enable = mkEnableOption "this do what?";
    };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        iverilog
        gtkwave
        surfer
      ];
    };
  }
