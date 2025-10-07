{
  config,
  pkgs,
  ...
}: {
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.packages = with pkgs; [
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "kafeitu";
    };
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "AleksandarZhekovski";
    userEmail = "aleksandarzhekovski@protonmail.com";
  };
  #
  # gtk = {
  #   # enable = true;
  #   iconTheme = {
  #     name = "oomox-gruv-dark";
  #     package = pkgs.gruvbox-dark-icons-gtk;
  #   };
  # };
  #
  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  #   accent = "mauve";
  #
  #   cursors.enable = true;
  #   # gtk.enable = true;
  #   yazi.enable = true;
  # };
  #
  home.stateVersion = "25.05";
}
