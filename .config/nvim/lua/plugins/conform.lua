return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["python"] = { "black" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      black = {
        prepend_args = { "--line-length", "79" },
      },
    },
  },
}
