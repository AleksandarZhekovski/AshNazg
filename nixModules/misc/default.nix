{
  pkgs,
  lib,
  ...
}: {
  options = with lib; {
    timezone = mkOption {
      type = types.str;
    };
  };
}
