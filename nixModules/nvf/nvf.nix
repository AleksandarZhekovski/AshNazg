{inputs, ...}: rec {
  imports = [
    inputs.nvf.nixosModules.default
    ./nvf-keybinds.nix
  ];
  programs.nvf = {
    enable = true;
    settings = {
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

        highlight = {
          RainbowRed.fg = "#e06c75";
          RainbowYellow.fg = "#e5c07b";
          RainbowBlue.fg = "#61AFEF";
          RainbowOrange.fg = "#D19A66";
          RainbowGreen.fg = "#98C379";
          RainbowViolet.fg = "#C678DD";
          RainbowCyan.fg = "#56B6C2";
        };

        visuals = {
          indent-blankline = {
            enable = true;
            setupOpts = {
              indent = {
                highlight = [
                  # Rainbow blankgline is a bottomless pit of despair
                  # Hours wasted: 3
                  "RainbowRed"
                  "RainbowYellow"
                  "RainbowBlue"
                  "RainbowOrange"
                  "RainbowGreen"
                  "RainbowViolet"
                  "RainbowCyan"
                ];
              };
            };
          };
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
