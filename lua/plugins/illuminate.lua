-- [[ Illuminate ]]
-- Highlight current word occurrences

return {
    "RRethy/vim-illuminate",
    enabled = true,
    config = function()
        require('illuminate').configure({
            -- providers: provider used to get references in the buffer, ordered by priority
            providers = {
                'lsp',
                'treesitter',
                'regex',
            },
        })
    end,
}
