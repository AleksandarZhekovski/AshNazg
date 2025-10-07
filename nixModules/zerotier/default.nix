{lib, ...}: {
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) ++ [
  #   ];

  services.zerotierone = {
    enable = true;
    joinNetworks = ["363c67c55a84e9d4"];
  };
}
