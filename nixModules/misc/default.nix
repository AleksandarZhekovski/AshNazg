{ ... }: {
  imports = [
    ./allowedUnfreePkgs.nix
    ./basePkgs.nix
    ./homeCantDoThis.nix
    ./firewall.nix
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
