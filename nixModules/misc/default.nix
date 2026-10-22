{
  pkgs,
  config,
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

  services.getty = {
    greetingLine = " --- Wellcome to AshNazg#${config.networking.hostName} ---";
    helpLine = "Abandon all hope ye who enter here";
  };

  environment.systemPackages = with pkgs; [
    nano
  ];
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  networking = {
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };

}
