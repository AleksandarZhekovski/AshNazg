{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # ../../nixModlues/nvf.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
    };

    kernelModules = ["mitigations=off"];
  };

  networking = {
    hostName = "Acerer";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Sofia";

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

    kdePackages.ksystemlog
    kdePackages.sddm-kcm

    hardinfo2
    vlc
    wayland-utils
    wl-clipboard
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    openssh = {
      enable = true;
      ports = [2024];
      settings = {
        PasswordAuthentication = true;
      };
    };

    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };

    desktopManager = {
      plasma6.enable = true;
    };
  };

  system.stateVersion = "25.05";
}
