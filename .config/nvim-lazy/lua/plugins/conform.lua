require("conform").setup({
  formatters_by_ft = {
    python = { "ruff_format" }, -- or "ruff" if you want both linting and formatting
  },
})
