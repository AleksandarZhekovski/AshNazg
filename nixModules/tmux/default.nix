{
  lib,
  config,
  ...
}:
with lib;
{
  options.tmux = {

    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable tmux and it's config";
    };

  };

  config = mkIf config.tmux.enable (mkMerge [
    {
      programs.tmux = {
        enable = true;

      };
    }

    # (mkIf config._option_.b {
    #   # if be is enabled
    # })

  ]);
}
