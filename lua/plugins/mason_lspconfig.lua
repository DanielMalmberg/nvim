-- [[ Mason LSP config ]]
-- Bridges Mason.nvim with the LspConfig plugin

return {

  "williamboman/mason-lspconfig.nvim",
  config = function()
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local lsp_map = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      --lsp_map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      -- vim.keymap.set('n', '<leader>rn', ":IncRename", { noremap = true, silent = true })
      lsp_map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })


      lsp_map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      lsp_map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      lsp_map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      lsp_map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      lsp_map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      lsp_map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      lsp_map('K', vim.lsp.buf.hover, 'Hover Documentation')
      lsp_map('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      lsp_map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      lsp_map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      lsp_map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      lsp_map('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- Broadcast additional completion capabilities from nvim-cmp to lsp servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Enable default language servers
    local servers = {
      html = {},
      jsonls = {},
      tsserver = {},
      pylsp = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end
}
