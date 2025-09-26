{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../nixModules/nvf/nvf.nix
    ../../nixModules/ssh/ssh.nix
    ../../nixModules/zerotier/zerotier.nix
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

  users = {
    defaultUserShell = pkgs.zsh;

    users.alex = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      packages = with pkgs; [
      ];
    };

    users.dimitar = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    git

    kdePackages.ksystemlog
    kdePackages.sddm-kcm

    hardinfo2
    vlc
    wayland-utils
    wl-clipboard

    kitty
    nano
    brightnessctl
    btop
    wol
    unzip
    qbittorent
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  environment.sessionVariables = {
    TERM = "xterm-kitty";
  };

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

    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };

    desktopManager = {
      plasma6.enable = true;
    };
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-settings"
      "nvidia-persistenced"
    ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of
      # supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.legacy_390;

      # package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
    };
  };
  system.stateVersion = "25.05";
}
