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
    Host tErebor
      Hostname 100.64.64.200
      Port 2024
    Host te
      Hostname 10.244.0.200
      Port 2024
    Host le
      Hostname 192.168.1.200
      Port 2024

    Host tRivendell
      Hostname 100.64.64.100
      Port 2024
    Host tr
      Hostname 100.64.64.100
      Port 2024
    Host lr
      Hostname 192.168.1.100
      Port 2024

     ";

  users.users.alex.openssh.authorizedKeys.keyFiles = [
    ./Erebor_pub_key
    ./Rivendell_pub_key
    ./Bitwarden_pub_key
  ];

}
