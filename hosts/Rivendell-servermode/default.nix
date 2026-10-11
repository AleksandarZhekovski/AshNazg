{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./stuff.nix

    ../../nixModules
  ];

  hjem = {
    clobberByDefault = true;
    users = {
      alex = {
        enable = true;
        user = "alex";
        directory = "/home/alex";

      };
    };
  };

  basePkgs.enable = true;
  # hyprland.enable = true;
  tailscale.enable = true;
  # mc-server.enable = true;
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
    enable = false;
    steam = true;
    # lutris = true;
    # minecraft = true;
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

    interfaces = {
      enp3s0 = {
        wakeOnLan.enable = true;
      };
    };
    firewall = {
      allowedUDPPorts = [ 9 ];
    };
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
    enable32Bit = true;
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
      # kitty
    ])
    ++ (with pkgs-unstable; [
      # pear-desktop
      # vesktop
    ]);

  system.stateVersion = "24.11"; # tl;dr don't change this
}
