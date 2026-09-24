{ ... }:
{
  imports = [
    ./git-server.nix
  ];

  services.openssh = {
    enable = true;
    ports = [ 2024 ];
    settings = {
      PasswordAuthentication = false; # Keep this on!!!
    };
  };

  programs.ssh.extraConfig = "
    Host tr
      Hostname 100.64.64.100
      Port 2024
    Host lr
      Hostname 192.168.1.100
      Port 2024

    Host te
      Hostname 100.64.64.200
      Port 2024
    Host le
      Hostname 192.168.1.200
      Port 2024

    Host tu
      Hostname 100.64.64.120
      Port 2024
    Host lu
      Hostname 192.168.1.120
      Port 2024

     ";

  users.users.alex.openssh.authorizedKeys.keyFiles = [
    ./Bitwarden_pub_key
    ./Erebor_pub_key
    ./Rivendell_pub_key
    ./Udun_pub_key
  ];

}
