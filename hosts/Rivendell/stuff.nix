{...}: {
  virtualisation.docker.enable = true;
  users.users.alex.extraGroups = [ "docker" ];
}
