# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  inputs,
  lib,
  pkgs,
  nixpkgs-unstable,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../tuigreet/greeter.nix 
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = ["amdgpu"];
    kernelParams = ["mitigations=off"];
  };

  networking = {
    hostName = "Rivendell"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };

  time.timeZone = "Europe/Sofia";

  services = {
    openssh = {
      enable = true;
      ports = [2024];
      settings = {
        PasswordAuthentication = true;
      };
    };

    zerotierone = {
      enable = true;
      joinNetworks = [
        "363c67c55a84e9d4"
      ];
    };

    blueman.enable = true;

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
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      amdvlk
    ];
  };
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    steam.enable = true;
    zsh.enable = true;
    yazi.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      obsidian
      vesktop
      p7zip
      lutris-free
      # via
      youtube-music
    ];
  };
  environment.variables.EDITOR = "nvim";
  environment.systemPackages =
    (with pkgs; [
      inputs.self.packages.${pkgs.stdenv.system}.nvim-saka
      tree
      tofi
      kitty
      hyprshot
      hyprpaper
      playerctl
      nano
      wget
      killall
      brightnessctl
      btop
      wol
      unzip
      # qbittorrent-cli
      # qbittorrent
      clinfo
      alejandra
    ])
    ++ (with nixpkgs-unstable; [
      quickshell
    ]);

  fonts.packages = with pkgs; [
    nerd-fonts.hack
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
