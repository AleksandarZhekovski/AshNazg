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

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nvf,
    home-manager,
    catppuccin,
    nixos-hardware,
    ...
  }: {
    # Something to do with nvf
    packages.x86_64-linux.nvim-saka =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./whatnamethis/nvf-config.nix];
      }).neovim;

    # Erebor: Thinkpad laptop used for studying and coding
    nixosConfigurations.Erebor = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ({pkgs, ...}: {
          environment.systemPackages = [self.packages.${pkgs.stdenv.system}.nvim-saka];
        })

        nixos-hardware.nixosModules.lenovo-thinkpad-l13

        ./hosts/Erebor/config.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.alex = {
            imports = [
              ./hosts/Erebor/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
        }
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
