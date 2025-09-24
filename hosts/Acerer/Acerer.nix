{
  inputs,
  config,
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

    kernelParams = ["mitigations=off"];
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

    nano
    brightnessctl
    btop
    wol
    unzip
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  ];

  programs = {
    firefox.enable = true;
    zsh.enable = true;
    yazi.enable = true;
  };

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

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getNamo pkg) [
      "nvidia-settings"
      "nvidia-persistenced"
    ];

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_390;

  system.stateVersion = "25.05";
}
