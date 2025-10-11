{
  pkgs,
  inputs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.hyprland}/bin/hyprland -c /home/alex/AshNazg/whatnamethis/hypr/Rivendell/Rivendell.conf";
        user = "alex";
      };
      default_session = {
        command = "${pkgs.zsh}/bin/zsh";
        user = "alex";
      };
    };
  };
}
