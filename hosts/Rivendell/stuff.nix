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
      25565
    ];
    allowedTCPPorts = [
      80
      443
      2024
      25565
    ];
  };

  virtualisation.waydroid = {
  # enable = true;
    package = pkgs-unstable.waydroid-nftables;
  };
}
