{inputs, ...}: {
  imports = [
    inputs.nvf.nixosModules.default
    ./nvf-keybinds.nix
    ./nvf-styling.nix
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          tabstop = 4;
          shiftwidth = 2;
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

        lsp.enable = true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
          nix.format.enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}
