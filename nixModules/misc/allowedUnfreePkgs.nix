{lib, ...}: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
        "zerotierone"
        "minecraft-server"
        "citrix-workspace"
      ];
  };
}
