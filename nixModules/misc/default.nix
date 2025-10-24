{...}: {
  imports = [
    ./allowedUnfreePkgs.nix
    ./basePkgs.nix
    ./timezone.nix
    ./homeCantDoThis.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
