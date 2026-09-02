{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.citrix-workspace = {
    enable = mkEnableOption "Citrix workspace";
  };

  config = mkIf config.citrix-workspace.enable (mkMerge [
    {
      environment.systemPackages = with pkgs; [
        citrix-workspace
      ];
      nixpkgs.config.permittedInsecurePackages = [
        "libsoup-2.74.3"
      ];
    }

    # (mkIf config._option_.b {
    #   # if be is enabled
    # })

  ]);
}
# https://nixos.freundcloud.com/applications/CITRIX-WORKSPACE-SETUP/
