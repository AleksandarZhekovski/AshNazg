{...}: {
  imports = [
    ./allowedUnfreePkgs.nix
    ./basePkgs.nix
    ./homeCantDoThis.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
