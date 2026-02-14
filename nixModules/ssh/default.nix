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
    Host zErebor
      Hostname 10.244.0.200
      Port 2024
    Host ze
      Hostname 10.244.0.200
      Port 2024
    Host le
      Hostname 192.168.1.100
      Port 2024

    Host zRivendell
      Hostname 10.244.0.100
      Port 2024
    Host zr
      Hostname 10.244.0.100
      Port 2024
    Host lr
      Hostname 192.168.1.100
      Port 2024

    Host zAcerer
      Hostname 10.244.0.250
      Port 2024
    Host za
      Hostname 10.244.0.250
      Port 2024
     ";

  users.users.alex.openssh.authorizedKeys.keyFiles = [
    ./Erebor_pub_key
    ./Rivendell_pub_key
    ./Bitwarden_pub_key
  ];

}
