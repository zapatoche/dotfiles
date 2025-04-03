return {
  "brenoprata10/nvim-highlight-colors",
  opts = function()
    require("nvim-highlight-colors").setup({
      render = "first_column",
    })
  end,
}
