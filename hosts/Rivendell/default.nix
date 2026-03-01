# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  lib,
  pkgs,
  pkgs-stable,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./greeter.nix
    ./stuff.nix

    ../../nixModules
  ];

  basePkgs.enable = true;
  hyprland.enable = true;
  # verilog.enable = true;
  zerotier.enable = true;
  #mc-server.enable = true;
  git-server.enable = true;

  audio = {
    enable = true;
    roc-source = {
      enable = true;
      source-port = 4723;
      repair-port = 4724;
      name = "Rivendell ROC receiver source";
      node-name = "Rivendell ROC teceiver";
    };

    roc-sink = {
      enable = true;
      remote-ip = "192.168.1.200";
      source-port = 4713;
      repair-port = 4714;
      name = "Rivendell ROC transmiter source";
      node-name = "Rivendell ROC transmiter";
    };
  };

  gaming = {
    enable = true;
    lutris = true;
    minecraft = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [
      "amdgpu"
      "btusb"
    ];
    kernelParams = [ "mitigations=off" ];
  };

  networking = {
    hostName = "Rivendell"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };

  time.timeZone = "Europe/Sofia";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  hardware.enableRedistributableFirmware = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    variables.TERM = "xterm-kitty";
  };
  environment.systemPackages =
    (with pkgs; [
      kitty
      vesktop
      pear-desktop
    ])
    ++ (with pkgs-stable; [
    ]);

  system.stateVersion = "24.11"; # tl;dr don't change this
}
