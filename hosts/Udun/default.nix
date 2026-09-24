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
  # citrix-workspace.enable = true;

  services = {
    blueman.enable = true;
    upower.enable = true;
    # fprintd.enable = true;
    tlp.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
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
     # "mitigations=off"
    ];
  };
  time.timeZone = "Europe/Sofia";
  system.stateVersion = "24.11"; # Did you read the comment?
}
