{ pkgs, ... }:
{
  # virtualisation.docker.enable = true;
  # users.users.alex.extraGroups = [ "docker" ];

  ### Factrio 29/12/25
  # environment.systemPackages = with pkgs; [
  #   factorio-headless
  # ];
  # # Also enable non-free packages or else the factorio download will fail:
  # nixpkgs.config.allowUnfree = true;

  # services.factorio = {
  #   enable = true;
  #   openFirewall = true;
  # };
  # services.factorio.game-password = "1234";

  # networking.firewall.enable = false;
}
