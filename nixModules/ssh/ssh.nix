{...}: {
  services.openssh = {
    enable = true;
    ports = [2024];
    settings = {
      PasswordAuthentication = true;
    };
  };

  users.users.alex.openssh.authorizedKeys.keyFiles = [
    ./Erebor_pub_key
    ./Rivendell_pub_key
  ];
}
