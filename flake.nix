{
  description = "AshNazg";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nvf,
    home-manager,
    catppuccin,
    ...
  }: {
    # Something to do with nvf
    packages.x86_64-linux.nvim-saka =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./whatnamethis/nvf-config.nix];
      }).neovim;

    # Am I doing this right
    nixosConfigurations.Erebor = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix
      ];
    };

    # Rivendell, big home computer used for gaming, coding, studying and much more
    nixosConfigurations.Rivendell = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({pkgs, ...}: {
          environment.systemPackages = [self.packages.${pkgs.stdenv.system}.nvim-saka];
        })

        ./hosts/Rivendell/config.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.alex = {
            imports = [
              ./hosts/Rivendell/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
        }
      ];
    };
  };
}
