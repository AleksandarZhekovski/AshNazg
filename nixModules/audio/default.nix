{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.audio;
in
with lib;
{
  options.audio = {
    enable = mkEnableOption "Pipewire, pipewire-pulse, wireplumber, audio servers and configs";

    roc-source = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "ROC Source, it stays on the client";
      };

      source-port = mkOption {
        type = types.port;
        default = 4713;
        description = "For the ROC connection";
      };

      repair-port = mkOption {
        type = types.port;
        default = 4714;
        description = "For the ROC repair, whatever that is";
      };

      name = mkOption {
        type = types.str;
        default = "remote soundcard";
        description = "";
      };

      node-name = mkOption {
        type = types.str;
        default = "remote source";
        description = "";
      };
    };

    roc-sink = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "ROC sink, acts a server";
      };

      remote-ip = mkOption {
        type = types.str;
        default = "192.168.1.100";
        description = "ip to witch to stream to";
      };

      source-port = mkOption {
        type = types.port;
        default = 4713;
        description = "For the ROC connection";
      };

      repair-port = mkOption {
        type = types.port;
        default = 4714;
        description = "For the ROC repair, whatever that is";
      };

      name = mkOption {
        type = types.str;
        default = "ROC stream soundcard";
        description = "";
      };

      node-name = mkOption {
        type = types.str;
        default = "ROC sink";
        description = "";
      };
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      # rtkit is optional but recommended
      # security.rtkit.enable = true;

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
      # systemWide = true;
    }

    (mkIf cfg.roc-source.enable {
      services.pipewire.extraConfig.pipewire = {
        "10-roc-source" = {
          "context.modules" = [
            {
              name = "libpipewire-module-roc-source";
              args = {
                "fec.code" = "rs8m";
                "local.ip" = "0.0.0.0";
                "resampler.profile" = "medium";
                "local.source.port" =       "${toString cfg.roc-source.source-port}";
                "local.repair.port" =       "${toString cfg.roc-source.repair-port}";
                "source.name" =             "${toString cfg.roc-source.name}";
                "source.props.node.name" =  "${toString cfg.roc-source.node-name}";
              };
            }
          ];
        };
      };
    })

    (mkIf cfg.roc-sink.enable {
      services.pipewire.extraConfig.pipewire = {
        "10-roc-sink.conf" = {
          "context.modules" = [
            {
              name = "libpipewire-module-roc-sink";
              args = {
                "fec.code" = "rs8m";
                "remote.ip" =               "${cfg.roc-sink.remote-ip}"; # Server IP
                "remote.source.port" =      "${toString cfg.roc-sink.source-port}"; # Source port on the server
                "remote.repair.port" =      "${toString cfg.roc-sink.repair-port}"; # Repair port on the server
                "sink.name" =               "${cfg.roc-sink.name}"; # Sink name
                "sink.props.node.name" =    "${cfg.roc-sink.node-name}"; # Node name for the sink
              };
            }
          ];
        };
      };
    })
  ]);
}

# networking.firewall = {
#   allowedTCPPorts = [
#     # pipewire-roc
#     4713
#     4714
#   ];
#   allowedUDPPorts = [
#     # pipewire-roc
#     4713
#     4714
#   ];
# };
