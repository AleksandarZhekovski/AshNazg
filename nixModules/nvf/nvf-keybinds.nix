{...}: {
  programs.nvf = {
    settings = {
      vim = {
        keymaps = [
          {
            desc = "Toggle Neotree";
            key = "<leader>e";

            mode = "n";
            action = ":Neotree toggle<CR>";
          }

          {
            desc = "Prevus buffer";
            key = "H";

            mode = "n";
            action = ":bn <CR>";
            noremap = false;
          }

          {
            desc = "Next buffer";
            key = "L";

            mode = "n";
            action = ":bp <CR>";
            noremap = false;
          }

          {
            desc = "Close current buffer";
            key = "Q";

            mode = "n";
            action = "bd";
            noremap = false;
          }

          {
            key = "q";
            desc = "fuck macros";
            
            mode = ["n" "v" "c"];
            action = "";
            noremap = false;
          }
        ];

        binds = {
          whichKey.enable = true;
        };
      };
    };
  };
}
