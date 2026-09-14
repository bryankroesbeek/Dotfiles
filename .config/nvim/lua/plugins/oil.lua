local oil = require("oil")
local util = require("oil.util")

-- REQUIRED
oil:setup()
-- REQUIRED

util.run_after_load(0, function ()
  oil.open_preview()
end)

vim.keymap.set("n", "\\", function()
  local oil_path = "oil://"
  local path = vim.fn.expand("%")
  local open = path:sub(1, #oil_path) == oil_path
  if (open) then
    oil.close()
  else
    oil.open()
    util.run_after_load(0, function ()
      oil.open_preview()
    end)
  end
end)
