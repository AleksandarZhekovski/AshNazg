# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./greeter.nix

    ../../nixModules
  ];

  

  nix.settings.experimental-features = ["nix-command" "flakes"];

  basePkgs.enable = true;
  hyprland.enable = true;
  verilog.enable = true;
  zerotier.enable = true;

  gaming = {
    enable = true;
    lutris = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = ["amdgpu" "btusb"];
    kernelParams = ["mitigations=off"];
  };

  networking = {
    hostName = "Rivendell"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };

  time.timeZone = "Europe/Sofia";

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      extraConfig = {
      };
    };
  };

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
      amdvlk
    ];
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    variables.TERM = "xterm-kitty";
  };
  environment.systemPackages = with pkgs; [
    kitty
    youtube-music
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      "zerotierone"
    ];

  system.stateVersion = "24.11"; # tl;dr don't change this
}
