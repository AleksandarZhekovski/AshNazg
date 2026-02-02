{ pkgs, pkgs-unstable, ... }:
{
  # virtualisation.docker.enable = true;
  # users.users.alex.extraGroups = [ "docker" ];

  environment.systemPackages =
    (with pkgs; [
      # libreoffice
    ])
    ++ (with pkgs-unstable; [
    ]);

  networking.firewall = {
    allowedUDPPorts = [
      34197
      2024

      # pipewire-roc
      4713
      4714
    ];
    allowedTCPPorts = [
      80
      443
      2024

      # pipewire-roc
      4713
      4714
    ];
  };
}
