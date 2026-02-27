return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      json = { "prettier" },
      jsonc = { "prettier" },
      terraform = { "terraform_fmt" },
      hcl = { "terraform_fmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
