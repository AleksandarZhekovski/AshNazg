{ pkgs, pkgs-unstable, ... }:
{
  # virtualisation.docker.enable = true;
  # users.users.alex.extraGroups = [ "docker" ];

  ### Factrio 29/12/25
  # In hosts/HOST/configuration.nix
  # # Also enable non-free packages or else the factorio download will fail:


  # services.nfs.server = {
  #   enable = true;
  #   exports = ''
  #     /export         *(rw,fsid=0,no_subtree_check)
  #     /export/SupernaturalS10  *(rw,nohide,insecure,no_subtree_check)
  #   '';
  # };

  # services.factorio = {
  #   enable = true;
  #   openFirewall = true;
  # };
  # services.factorio.game-password = "1234";

  services.fprintd.enable = true;

  # networking.firewall.enable = false;
  # virtualisation.waydroid = {
  #   enable = true;
  #   package = pkgs-unstable.waydroid-nftables;
  # };
  #   services.mosquitto = {
  #   enable = true;
  #   listeners = [
  #     {
  #       acl = [
  #           "pattern readwrite #"
  #         ];
  #       omitPasswordAuth = true;
  #       settings.allow_anonymous = true;
  #     }
  #   ];
  # };
  #
  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [ 1883 ];
  # };

}
