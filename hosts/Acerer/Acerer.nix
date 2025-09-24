{
  inpurt,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "Acerer";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Sofia";

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  users.users.alex = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
  ];

  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
