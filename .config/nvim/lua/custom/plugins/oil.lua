return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = { },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

  config = function()
    local oil = require("oil")
    local util = require("oil.util")

    -- REQUIRED
    oil:setup()
    -- REQUIRED

    util.run_after_load(0, function ()
      oil.open_preview()
    end)
  end,
}
