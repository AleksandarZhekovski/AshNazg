{
  description = "AshNazg: One config to rule them all";

  inputs = {
    nixpkgs-stable = {
      url = "github:NixOs/nixpkgs/nixos-25.11";
    };

    nixpkgs-unstable = {
      url = "github:NixOs/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs-stable,
      nixpkgs-unstable,
      nvf,
      home-manager,
      nixos-hardware,
      ...
    }:
    {
      # Rivendell, big home computer used for gaming, coding, studying, and much more
      nixosConfigurations.Rivendell = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
          };
        };
        modules = [
          ./hosts/Rivendell

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

      # Erebor: Thinkpad laptop used for studying and coding
      nixosConfigurations.Erebor = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
          };
        };

        modules = [
          nixos-hardware.nixosModules.lenovo-thinkpad-l13

          ./hosts/Erebor

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

      # nixosConfigurations.Acerer = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #
      #   specialArgs = {inherit inputs;};
      #
      #   modules = [
      #     ./hosts/Acerer
      #     home-manager.nixosModules.home-manager
      #     {
      #       home-manager = {
      #         useGlobalPkgs = true;
      #         useUserPackages = true;
      #
      #         users.alex = {
      #           imports = [
      #             ./hosts/Acerer/alex_home.nix
      #           ];
      #         };
      #
      #         users.dimitar = {
      #           imports = [
      #             ./hosts/Acerer/dimitar_home.nix
      #           ];
      #         };
      #       };
      #     }
      #   ];
      # };
    };
}
