{
  pkgs,
  ...
}: {
  imports = [
    ../../homeModules
  ];

  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.stateVersion = "25.05";
}
