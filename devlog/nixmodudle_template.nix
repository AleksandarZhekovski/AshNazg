{
  lib,
  config,
  ...
}:
with lib;
{
  options._option_ = {
    # this is the option
    enable = mkEnableOption "this do what?"; # enable is prety much mandatory

    _suboption_ = mkOption {
      # some suboption
      type = types.string;
      description = "the host";
    };

    _another_suboption_ = mkOption {
      # some suboption
      type = types.string;
      description = "the host";
    };
  };

  config = mkIf config._option_.enable (mkMerge [
    # if enable is on
    {
      # always of if enabled
    }

    (mkIf config._option_.b {
      # if be is enabled
    })

    (mkIf config._option_.c {
      # if c is enabled
    })
  ]);
}
