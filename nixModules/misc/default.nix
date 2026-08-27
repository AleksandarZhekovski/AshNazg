{
  pkgs,
  ...
}:
{
  imports = [
    ./allowedUnfreePkgs.nix
    ./basePkgs.nix
    ./firewall.nix
    ./tEmPoRaRy_FiXeS.nix
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    nano
  ];
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
