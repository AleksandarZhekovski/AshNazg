{
  description = "Splinter: My NixOs flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    home-manager,
    ...
  } @ inputs: {
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
    #
    nixosConfigurations.Rivendell = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/Rivendell/config.nix
        ({pkgs, ...}: {
          environment.systemPackages = [self.packages.${pkgs.stdenv.system}.nvim-saka];
        })
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.alex = import ./hosts/Rivendell/home.nix;
        }
      ];
    };
  };
}
