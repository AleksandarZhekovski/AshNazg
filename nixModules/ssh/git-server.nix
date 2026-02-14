{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.git-server;
in
with lib;
{
  options.git-server = {

    enable = mkOption {
      type = types.bool;
      default = false;
      description = "git server";
    };
  };

  config = mkIf cfg.enable {

    users.users.git = {
      isSystemUser = true;
      group = "git";
      home = "/var/lib/git-server";
      createHome = true;
      shell = "${pkgs.git}/bin/git-shell";
      # Already done in ssh/deafult.nix
      # openssh.authorizedKeys.keys = [
      #   # : Add pubkeys of authorized users
      #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF38sHxXn/r7KzWL1BVCqcKqmZA/V76N/y5p52UQghw7 example"
      # ];
    };

    users.groups.git = { };

    services.openssh = {
      enable = true;
      extraConfig = ''
        Match user git
          AllowTcpForwarding no
          AllowAgentForwarding no
          PermitTTY no
          X11Forwarding no
      '';
    };

  };
}
