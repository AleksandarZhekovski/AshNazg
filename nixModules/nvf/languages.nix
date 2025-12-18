{
  ...
}:
{
  # Language shit
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      harper-ls = {
        enable = true;
      };
    };

    languages = {
      # Just enable them one by one
      # enableTreesitter = true;
      # enableFormater = true;

      nix = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      clang = {
        enable = true;
        # format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      bash = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      python = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      qml = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      html = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        # treesitter.enable = true;
      };

      css = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        # treesitter.enable = true;
      };
    };

  };
}
