{
  config,
  lib,
  ...
}:
{
  programs.nvf.settings.vim.binds.whichKey.enable = true;

  # vim.telescope.mappings = lib.mapAttrs (_: _: null) config.vim.lsp.mappings;
  # programs.nvf.settings.vim.vendoredKeymaps.enable = false;

  programs.nvf.settings.vim = {

    lsp.mappings = {
      # let
      #   blah = lib.mapAttrsToList (name: value: name) config.programs.nvf.settings.vim.lsp.mappings;
      # in
      #     lib.genAttrs blah (name: null);
      addWorkspaceFolder = null;
      codeAction = "La";
      documentHighlight = "Ld";
      format = "Lf";
      goToDeclaration = null;
      goToDefinition = null;
      goToType = null;
      hover = "Lh";
      listDocumentSymbols = null;
      listImplementations = null;
      listReferences = null;
      listWorkspaceFolders = null;
      listWorkspaceSymbols = null;
      nextDiagnostic = null;
      openDiagnosticFloat = null;
      previousDiagnostic = null;
      removeWorkspaceFolder = null;
      renameSymbol = null;
      signatureHelp = null;
      toggleFormatOnSave = null;
    };

    # vim.telescope.mappings = lib.mapAttrs (_: _: null) config.vim.lsp.mappings;

    keymaps = [
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
        action = ":BufferLineCyclePrev<CR>";
        noremap = true;
        nowait = true;
      }

      {
        desc = "Next buffer";
        key = "<leader>l";

        mode = "n";
        action = ":BufferLineCycleNext<CR>";
        noremap = true;
        nowait = true;
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

        mode = [ "n" ];
        action = ":quit<CR>";
        noremap = false;
      }

      {
        desc = "Write all";
        key = "<leader>w";

        mode = [ "n" ];
        action = "<Esc>:wall<CR>";
      }
    ];
  };
}
