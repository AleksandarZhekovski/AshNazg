{lib, ...}: {
  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "obsidian"
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
        "zerotierone"
      ];
  };
}
