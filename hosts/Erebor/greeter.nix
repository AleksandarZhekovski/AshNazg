{
  pkgs,
  inputs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.hyprland}/bin/start-hyprland";
        user = "alex";
      };
      default_session = {
        command = "${pkgs.zsh}/bin/zsh";
        user = "alex";
      };
    };
  };
}
