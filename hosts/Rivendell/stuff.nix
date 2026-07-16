{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    citrix_workspace
  ];

  # In hosts/HOST/configuration.nix
  # # Also enable non-free packages or else the factorio download will fail:
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

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
