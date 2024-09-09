{
  plugins = {
    fidget.enable = true;
    lsp = {
      enable = true;
      keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gT = "type_definition";
        "<leader>vrn" = "rename";
      };
      onAttach = ''
        vim.keymap.set('n', '<leader>vf', function()
          vim.lsp.buf.format({async = true})
        end)

        vim.keymap.set('i', '<c-t>', function()
          -- should close cmp if open
          local ok, cmp = pcall(require, 'cmp')
          if ok then
            cmp.close()
          end
          vim.lsp.buf.signature_help()
        end)

        vim.keymap.set({'v', 'n'}, '<leader>vca', vim.lsp.buf.code_action)
      '';

    };
  };

  extraConfigLua = ''
    vim.lsp.inlay_hint.enable()
  '';
}
