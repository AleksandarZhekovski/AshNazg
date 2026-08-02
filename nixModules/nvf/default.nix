{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.nvf.nixosModules.default
    ./keybinds.nix
    ./styling.nix
    ./languages.nix
  ];

  environment.systemPackages = with pkgs; [
    alejandra
    ripgrep
  ];
  environment.variables.EDITOR = "nvim";

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        options = {
          tabstop = 2;
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

        tabline.nvimBufferline = {
          enable = true;
          setupOpts.options = {
            numbers = lib.mkLuaInline "function(opts) return string.format('%s', opts.id) end ";
            hover.enabled = false;
            show_buffer_close_icons = false;

          };

        };

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
