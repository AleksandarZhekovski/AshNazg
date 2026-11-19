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

  networking.hostName = "Udun";

  basePkgs = {
    enable = true;
    heavy = false;
  };

  hyprland = {
    enable = true;
    host = "Udun";
  };

  tailscale.enable = true;
  # pi-hole.enable = true;
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
    initrd.availableKernelModules = [
      "thinkpad_acpi"
    ];
    kernelParams = [
      # "mitigations=off"
      "acpi_backlight=native"
      "psmouse.synaptics_intertouch=0"
    ];

  };
  time.timeZone = "Europe/Sofia";
  system.stateVersion = "24.11"; # Did you read the comment?
}
