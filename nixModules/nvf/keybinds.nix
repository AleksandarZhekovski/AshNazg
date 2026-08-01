{...}: {
  programs.nvf.settings.vim.binds.whichKey.enable = true;

  programs.nvf.settings.vim.keymaps = [
    {
      desc = "Toggle Neotree";
      key = "<leader>e";

      mode = "n";
      action = ":Neotree toggle<CR>";
    }

    {
      desc = "Prevus buffer";
      key = "<leader>h";

      mode = "n";
      action = ":bn<CR>";
      noremap = false;
    }

    {
      desc = "Next buffer";
      key = "<leader>l";

      mode = "n";
      action = ":bp<CR>";
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
      action = ":quit<CR>";
      noremap = false;
    }

    {
      desc = "Write all";
      key = "<leader>w";

      mode = ["n" "i"];
      action = "<Esc>:wall<CR>";
    }
  ];

}
