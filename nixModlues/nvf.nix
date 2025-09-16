{inputs, ...}: {
  imports = [inputs.nvf.nixosModules.default];

  programs.nvf = {
    enable = true;
    vim = {
      options = {
        tabstop = 2;
        shiftwidth = 2;
      };

      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      visuals = {
        indent-blankline = {
          enable = true;
          #setupOpts = {
          #indent = {
          #highlight = [
          # Rainbow blankgline is a bottomless pit of despair
          # Hours wasted: 3
          # "#E06C75"
          #  "RainbowYellow"
          #  "RainbowBlue"
          #  "RainbowOrange"
          #  "RainbowGreen"
          #   "RainbowViolet"
          #  "RainbowCyan"
          #];
          #};
          #};
        };
      };

      keymaps = [
        {
          key = "<leader>e";
          mode = "n";
          silent = true;
          action = ":Neotree";
        }
      ];
      binds = {
        whichKey.enable = true;
      };

      git = {
        enable = true;
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
}
