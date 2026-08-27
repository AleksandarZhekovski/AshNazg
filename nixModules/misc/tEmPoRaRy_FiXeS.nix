{
  pkgs,
  ...
}:
{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
  ];
}
