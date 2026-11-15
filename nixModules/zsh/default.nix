{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.zsh = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Zsh config";
    };
  };

  config = mkIf config.zsh.enable (mkMerge [
    {
      programs.zsh.enable = true;
      users.defaultUserShell = pkgs.zsh;

      hjem.users.alex.files = {
        ".config/zsh/.zshrc".source = ./.zshrc;
        ".config/zsh/config".source = ./config;
      };
    }
  ]);
}
