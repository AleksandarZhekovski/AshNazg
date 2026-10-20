{
  pkgs,
  pkgs-stable,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./stuff.nix

    ../../nixModules
  ];

  networking.hostName = "Erebor";

  basePkgs = {
    enable = true;
    heavy = true;
  };

  hyprland = {
    enable = true;
    host = "Erebor";
  };

  tailscale.enable = true;
  pi-hole.enable = true;
  citrix-workspace.enable = true;

  services = {
    blueman.enable = true;
    upower.enable = true;
    tlp.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # Required for modern Intel GPUs (Xe iGPU and ARC)
        intel-media-driver # VA-API (iHD) userspace
        vpl-gpu-rt # oneVPL (QSV) runtime
      ];
    };
  };

  audio = {
    enable = true;
    roc-source = {
      enable = true;
      source-port = 4713;
      repair-port = 4714;
      name = "Erebor ROC receiver source";
      node-name = "Erebor ROC teceiver";
    };

    roc-sink = {
      enable = true;
      remote-ip = "192.168.1.100";
      source-port = 4723;
      repair-port = 4724;
      name = "Erebor ROC transmiter source";
      node-name = "Erebor ROC transmiter";
    };
  };

  gaming = {
    # enable = true;
    # lutris = true;
  };

  environment.systemPackages =
    (with pkgs; [
      brightnessctl
      # pear-desktop
      # vesktop
    ])
    ++ (with pkgs-stable; [
    ]);

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "mitigations=off"
    ];
  };
  time.timeZone = "Europe/Sofia";
  system.stateVersion = "24.11"; # Did you read the comment?
}
