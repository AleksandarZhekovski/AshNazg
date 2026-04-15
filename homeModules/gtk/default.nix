{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 32;
  };

  gtk = {
    enable = true;
    colorScheme = "dark";

    gtk4.theme = null;
  };

}
