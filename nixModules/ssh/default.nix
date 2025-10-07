{...}: {
  services.openssh = {
    enable = true;
    ports = [2024];
    settings = {
      PasswordAuthentication = true;
    };
  };

  programs.ssh.extraConfig = "
    Host zErebor
      Hostname 10.244.0.200
      Port 2024
      User alex
    Host ze
      Hostname 10.244.0.200
      Port 2024
      User alex

    Host zRivendell
      Hostname 10.244.0.100
      Port 2024
      User alex
    Host zr
      Hostname 10.244.0.100
      Port 2024
      User alex

    Host zAcerer
      Hostname 10.244.0.250
      Port 2024
      User alex
    Host za
      Hostname 10.244.0.250
      Port 2024
      User alex
     ";

  users.users.alex.openssh.authorizedKeys.keyFiles = [
    ./Erebor_pub_key
    ./Rivendell_pub_key
  ];
}
