{...}: {
  programs.nvf.settings.vim.keymaps = [
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
      action = ":bp<bar>sp<bar>bn<bar>bd<CR>";
      noremap = false;
    }

    {
      desc = "Quit";
      key = "q";

      mode = ["n"];
      action = ":quit <CR>";
      noremap = false;
    }

    {
      desc = "Write all";
      key = "<C-s>";

      mode = "n";
      action = ":wall <CR>";
    }
  ];

  programs.nvf.settings.vim.binds.whichKey.enable = true;
}
