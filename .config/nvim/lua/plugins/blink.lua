require("blink.cmp").setup({
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
  },

  keymap = {
    preset = "default",

    ["<CR>"] = { "select_and_accept", "fallback" },
    ["<M-CR>"] = { "fallback" },
  },
})
