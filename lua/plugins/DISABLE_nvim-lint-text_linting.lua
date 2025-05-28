return {
  "mfussenegger/nvim-lint",
  enabled = false,
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  }
}
