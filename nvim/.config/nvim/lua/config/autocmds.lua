-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set highlight groups
vim.api.nvim_create_autocmd("BufRead", {
    callback = function()
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#7F85B5" })
    end,
})
