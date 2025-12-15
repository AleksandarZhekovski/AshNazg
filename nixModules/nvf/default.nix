{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nvf.nixosModules.default
    ./keybinds.nix
    ./styling.nix
    ./languages.nix
  ];

  environment.systemPackages = with pkgs; [ alejandra ];
  environment.variables.EDITOR = "nvim";

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        options = {
          tabstop = 4;
          shiftwidth = 2;
        };

        ui.illuminate = {
          enable = true;
        };

        git = {
          enable = true;
        };

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        tabline.nvimBufferline.enable = true;

        utility.smart-splits.enable = true;

        filetree.neo-tree.enable = true;
        fzf-lua.enable = true;

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

      };
    };
  };
}
