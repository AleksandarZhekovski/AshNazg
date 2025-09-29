{
  description = "AshNazg: One config to rule them all";

  inputs = {
    nixpkgs = {
      url = "github:NixOs/nixpkgs/nixos-25.05";
    };

    nixpkgs-unstable = {
      url = "github:NixOs/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nvf,
    home-manager,
    nixos-hardware,
    ...
  }: {
    # Something to do with nvf

    # Erebor: Thinkpad laptop used for studying and coding
    nixosConfigurations.Erebor = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
        nixpkgs-unstable = import nixpkgs-unstable {
          system = "x86_64-linux";
        };
      };

      modules = [
        nixos-hardware.nixosModules.lenovo-thinkpad-l13

        ./hosts/Erebor/Erebor.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.alex = {
              imports = [
                ./hosts/Erebor/home.nix
              ];
            };
          };
        }
      ];
    };

    # Rivendell, big home computer used for gaming, coding, studying and much more
    nixosConfigurations.Rivendell = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
        nixpkgs-unstable = import nixpkgs-unstable {
          system = "x86_64-linux";
        };
      };
      modules = [
        ./hosts/Rivendell/Rivendell.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.alex = {
              imports = [
                ./hosts/Rivendell/home.nix
              ];
            };
          };
        }
      ];
    };

    nixosConfigurations.Acerer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/Acerer/Acerer.nix
      ];
    };
  };
}
