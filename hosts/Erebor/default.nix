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

  basePkgs.enable = true;
  hyprland = {
    enable = true;
    host = "Erebor";
  };
  tailscale.enable = true;
  pi-hole.enable = true;
  citrix-workspace.enable = true;

  services.fprintd.enable = true;
  services.tlp.enable = true;

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
    enable = true;
    # lutris = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "mitigations=off"
      "thinkpad_acpi.fancontrol=1"
    ];
  };

  networking = {
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };

  time.timeZone = "Europe/Sofia";

  services = {
    # what does this do???
    fwupd.enable = true;

    # huh?
    blueman.enable = true;
    upower.enable = true;

    # this doesn't work
    thinkfan = {
      enable = true;
      levels = [
        [
          0
          0
          55
        ]
        [
          1
          53
          60
        ]
        [
          2
          58
          65
        ]
        [
          3
          63
          70
        ]
        [
          4
          68
          75
        ]
        [
          5
          73
          80
        ]
        [
          7
          78
          85
        ]
        [
          127
          85
          32767
        ]
      ];
    };
  };

  # huh 2.0
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  environment.systemPackages =
    (with pkgs; [
      brightnessctl
      # pear-desktop
      # vesktop
    ])
    ++ (with pkgs-stable; [
    ]);

  system.stateVersion = "24.11"; # Did you read the comment?
}
