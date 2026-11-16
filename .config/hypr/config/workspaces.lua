local mainMod = "SUPER"
local SHIFT = "SHIFT"
local ALT = "ALT"

local km = function(key_table)
    return table.concat(key_table, " + ")
end

for i = 1,10 do
  hl.workspace_rule({
    workspace = i .. "",
    monitor = "eDP-1"
  })
  hl.bind(km({ mainMod, i % 10 }), hl.dsp.focus({ workspace = i }))
  hl.bind(km({ mainMod, SHIFT, i % 10 }), hl.dsp.window.move({ workspace = i }))
end

for i = 1, 10 do
  local w = i + 10
  hl.workspace_rule({
    workspace = w .. "",
    monitor = "desc:Dell Inc. DELL P2421DC 41VTS03"
  })
  hl.bind(km({ mainMod, ALT, i % 10 }), hl.dsp.focus({ workspace = w }))
  hl.bind(km({ mainMod, SHIFT, ALT, i % 10 }), hl.dsp.window.move({ workspace = w }))
end

local keys = { 'bracketleft', 'bracketright', 'backslash', 'semicolon', 'apostrophe'}
for i = 1, 5 do
  local w = i + 20
  hl.workspace_rule({
    workspace = w .. "",
    monitor = "desc:Dell Inc. DELL P2418D MY3ND8AF0E6T"
  })
  hl.bind(km({ mainMod, keys[i] }), hl.dsp.focus({ workspace = w }))
  hl.bind(km({ mainMod, SHIFT, keys[i] }), hl.dsp.window.move({ workspace = w }))
end
