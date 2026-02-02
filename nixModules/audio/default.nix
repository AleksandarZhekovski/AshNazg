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

    roc-source = mkOption {
      type = types.bool;
      default = false;
      description = "ROC Source";
    };
    roc-sink = mkOption {
      type = types.bool;
      default = false;
      description = "ROC sink";
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

      # configPackages = [
      #   (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/my-roc-sink.conf" ''
      #     context.modules = [
      #       {
      #         name = libpipewire-module-roc-sink
      #         args = {
      #           "fec.code" = disable
      #           "remote.ip" = 192.168.1.100 # Server IP
      #           "remote.source.port" = 4713 # Source port on the server
      #           "remote.repair.port" = 4714 # Repair port on the server
      #           "sink.name" = "Roc sink sound output" # Sink name
      #           "sink.props.node.name" = "roc-sink" # Node name for the sink
      #         }
      #       }
      #     ]
      #   '')
      # ];
    }

    (mkIf cfg.roc-source {
      services.pipewire.extraConfig.pipewire = {
        "10-roc-source" = {
          "context.modules" = [
            {
              name = "libpipewire-module-roc-source";
              args = {
                "fec.code" = "rs8m";
                "local.ip" = "0.0.0.0";
                "resampler.profile" = "medium";
                "local.source.port" = "4713";
                "local.repair.port" = "4714";
                "source.name" = "remote soundcard";
                "source.props.node.name" = "roc-source";
              };
            }
          ];
        };
      };
    })

    (mkIf cfg.roc-sink {
      services.pipewire.extraConfig.pipewire = {
        "10-roc-sink.conf" = {
          "context.modules" = [
            {
              name = "libpipewire-module-roc-sink";
              args = {
                "fec.code" = "rs8m";
                "remote.ip" = "192.168.1.100"; # Server IP
                "remote.source.port" = "4713"; # Source port on the server
                "remote.repair.port" = "4714"; # Repair port on the server
                "sink.name" = "remote sound output"; # Sink name
                "sink.props.node.name" = "roc-sink"; # Node name for the sink
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
