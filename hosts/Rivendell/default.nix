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

  networking.hostName = "Rivendell";

  basePkgs = {
    enable = true;
    heavy = true;
  };

  hyprland = {
    enable = true;
    host = "Rivendell";
  };

  tailscale.enable = true;
  # zerotier.enable = true;
  # mc-server.enable = true;
  git-server.enable = true;
  # radicale.enable = true;

  hardware = {
    bluetooth = {
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

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
  };

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
    # steam = true;
    # lutris = true;
    minecraft = true;
  };

  networking = {
    interfaces = {
      enp3s0 = {
        wakeOnLan.enable = true;
      };
    };
    firewall = {
      allowedUDPPorts = [ 9 ];
    };
  };

  environment.systemPackages =
    (with pkgs; [
      # kitty
    ])
    ++ (with pkgs-unstable; [
      # pear-desktop
      # vesktop
    ]);

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

  time.timeZone = "Europe/Sofia";
  system.stateVersion = "24.11"; # tl;dr don't change this
}
