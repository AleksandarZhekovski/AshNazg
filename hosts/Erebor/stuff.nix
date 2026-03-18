{ pkgs, pkgs-unstable, ... }:
{
  # virtualisation.docker.enable = true;
  # users.users.alex.extraGroups = [ "docker" ];

  ### Factrio 29/12/25
  environment.systemPackages = with pkgs; [
    genymotion
  ];
  # # Also enable non-free packages or else the factorio download will fail:
  nixpkgs.config.allowUnfree = true;


  # services.factorio = {
  #   enable = true;
  #   openFirewall = true;
  # };
  # services.factorio.game-password = "1234";

  # networking.firewall.enable = false;
  # virtualisation.waydroid = {
  #   enable = true;
  #   package = pkgs-unstable.waydroid-nftables;
  # };
  services.mosquitto = {
  enable = true;
  listeners = [
    {
      acl = [ "pattern readwrite #" ];
      omitPasswordAuth = true;
      settings.allow_anonymous = true;
    }
  ];
};

networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 1883 ];
};

}
