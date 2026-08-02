{
  lib,
  config,
  ...
}:
let
  cfg = config.a; # define optoin a
in
with lib;
{
  options.a = {
    # this is the option
    enable = mkEnableOption "this do what?"; # enable is prety much mandatory

    b = mkOption {
      # some suboption
      type = types.string;
      description = "the host";
    };

    c = mkOption {
      # some suboption
      type = types.string;
      description = "the host";
    };
  };

  config = mkIf cfg.enable (mkMerge [
    # if enable is on
    {
      # always of if enabled
    }

    (mkIf cfg.b {
      # if be is enabled
    })

    (mkIf cfg.c {
      # if c is enabled
    })
  ]);
}
