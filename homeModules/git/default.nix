{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "AleksandarZhekovski";
        email = "aleksandarzhekovski@protonmail.com";
      };
    };
  };
}
