{ pkgs, pkgs-unstable, ... }:
{
  #TODO establish the firewall
  networking.firewall = {
    allowedUDPPorts = [
      34197
      2024
      25565
    ];
    allowedTCPPorts = [
      80
      443
      2024
      25565
    ];
  };
}
