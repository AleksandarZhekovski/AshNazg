{...}: {
  users.users = {
    alex = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
    };

    # dimitar = {
    #   isNormalUser = true;
    #   extraGroups = ["wheel" "networkmanager" ];
    # };
  };
}
