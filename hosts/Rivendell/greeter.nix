{
  pkgs,
  inputs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/hyprland -c ${inputs.self}/whatnamethis/hypr/Rivendell/Rivendell.conf";
        user = "alex";
      };
      default_session = initial_session;
    };
  };
  
}
