{
  config,
  lib,
  ...
}:
{
  # Language shit
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      presets.harper.enable = true;
      # mappings = lib.mapAttrs (_: __: null) config.programs.nvf.settings.vim.lsp.mappings;
    };

    lsp.servers = {
      harper = {
        filetypes = [
          "asciidoc"
          "c"
          "clojure"
          "cmake"
          "cpp"
          "cs"
          "dart"
          "gitcommit"
          "go"
          "haskell"
          "html"
          "java"
          "javascript"
          "javascriptreact"
          "kotlin"
          "lhaskell"
          "lua"
          "mail"
          "markdown"
          "nix"
          "php"
          "python"
          "ruby"
          "rust"
          "txt"
          "text"
        ];
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

      # html = {
      #   enable = true;
      #   format.enable = true;
      #   lsp.enable = true;
      #   # treesitter.enable = true;
      # };
      #
      # css = {
      #   enable = true;
      #   format.enable = true;
      #   lsp.enable = true;
      #   # treesitter.enable = true;
      # };

      # csharp = {
      #   enable = true;
      #   # extensions.roslyn-nvim.enable = true;
      #   lsp.enable = true;
      #   treesitter.enable = true;
      # };

    };

  };
}
