return {
  "zbirenbaum/copilot.lua",
  -- Also load for new/unnamed buffers, where BufReadPost never fires.
  event = { "BufReadPost", "BufNewFile", "InsertEnter" },
  opts = function(_, opts)
    opts.suggestion = vim.tbl_deep_extend("force", opts.suggestion or {}, {
      enabled = true,
      auto_trigger = false,
      trigger_on_accept = false,
      hide_during_completion = true,
      keymap = {
        accept = "<M-f>",
        accept_word = "<M-w>",
        accept_line = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    })
    opts.filetypes = vim.tbl_extend("force", opts.filetypes or {}, {
      markdown = true,
      help = false,
      TelescopePrompt = false,
      ["dap-repl"] = false,
    })
    -- Accept AI suggestions only with the explicit keys, leaving Tab for snippets.
    LazyVim.cmp.actions.ai_accept = function()
      return false
    end
  end,
  keys = {
    {
      "<M-\\>",
      function()
        require("copilot.suggestion").next()
      end,
      mode = "i",
      desc = "Copilot: trigger suggestion",
    },
  },
}
