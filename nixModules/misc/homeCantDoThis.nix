{pkgs, ...}: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  home-manager.backupFileExtension = "backup";
}
