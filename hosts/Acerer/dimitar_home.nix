
{
  pkgs,
  ...
}: {
  imports = [
    ../../homeModules
  ];

  home.username = "dimitar";
  home.homeDirectory = "/home/dimitar";

  home.stateVersion = "25.05";
}
