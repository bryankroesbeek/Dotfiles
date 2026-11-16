-- source = ~/.config/hypr/config.d/monitors.conf

-- Program definitions
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "wofi --show drun"


-- Environment
hl.env("XCURSOR_SIZE","24")
hl.env("HYPRCURSOR_SIZE","24")
local path = os.getenv("PATH")
local home = os.getenv("HOME")
local path_table = {
    path,
    home .. "/.local/bin",
    home .. "/.local/scripts"
}
hl.env("PATH", table.concat(path_table, ":"))


hl.exec_cmd("echo $PATH > /tmp/hyprpath")

-- autostart config
hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("ydotoold")
    hl.exec_cmd("wlsunset -l 51.9 -L 4.4 -t 2700")
    hl.exec_cmd("swayosd-server")
end)

-- local monitors = ipairs(hl.get_monitors())
-- for _, monitor in monitors do 
--
-- end

-- Look and feel
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,

        border_size = 2,

        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = "rgba(a6e22eee)",
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false ,

        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 4,
            passes = 3,

            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.window_rule({
    name = "opacity-all",
    match = {
        class = ".*",
    },
    opacity = "1.0 0.8 1.0",
})

hl.window_rule({
    name = "opacity-ghostty",
    match = {
        class = "^(com.mitchellh.ghostty)$",
    },
    opacity = "0.9 0.8 0.95",
})

hl.window_rule({
    name = "opacity-alacritty",
    match = {
        class = "^([Aa]lacritty)$",
    },
    opacity = "0.9 0.8 0.95"
})

hl.window_rule({
    name = "opacity-firefox",
    match = {
        class = "^(firefox)$",
        title = "^([Pp]icture%-[Ii]n%-[Pp]icture)$"
    },
    opacity = "1.0 1.0 1.0"
})

-- Default curves and animations, see https://wiki.hypr.land/configuring/core/animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- Layout
hl.config({
    dwindle = {
        preserve_split = true,
    }
})

hl.config({
    master = {
        new_status = "master",
    }
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    }
})

-- Input
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


local mainMod = "SUPER"
local SHIFT = "SHIFT"
local RETURN = "RETURN"

local km = function(key_table)
    return table.concat(key_table, " + ")
end

hl.bind(km({ mainMod, RETURN }), hl.dsp.exec_cmd(terminal))
hl.bind(km({ mainMod, "L" }), hl.dsp.exec_cmd("hyprlock"))
hl.bind(km({ mainMod, "B" }), hl.dsp.exec_cmd("firefox"))
hl.bind(km({ mainMod, SHIFT, "B"}), hl.dsp.exec_cmd("firefox -p personal"))
hl.bind(km({ "print" }), hl.dsp.exec_cmd("$HOME/.config/sway/scripts/screenshot.sh"))

-- Actions
hl.bind(km({ mainMod, "Q" }), hl.dsp.window.close())
hl.bind(km({ mainMod, SHIFT, "Q" }), hl.dsp.window.kill())
hl.bind(km({ mainMod, SHIFT, "escape" }), hl.dsp.exit())

-- Panel management
hl.bind(km({ mainMod, SHIFT, "F" }), hl.dsp.window.float({ action = "toggle" }))
hl.bind(km({ mainMod, "R" }), hl.dsp.exec_cmd(menu))
hl.bind(km({ mainMod, "P" }), hl.dsp.window.pseudo())
hl.bind(km({ mainMod, "J" }), hl.dsp.layout("togglesplit"))
hl.bind(km({ mainMod, "F" }), hl.dsp.window.fullscreen())

-- Movement
hl.bind(km({ mainMod, "left" }), hl.dsp.focus({ direction = "left" }))
hl.bind(km({ mainMod, "right" }), hl.dsp.focus({ direction = "right" }))
hl.bind(km({ mainMod, "up" }), hl.dsp.focus({ direction = "up" }))
hl.bind(km({ mainMod, "down" }), hl.dsp.focus({ direction = "down" }))

hl.bind(km({ mainMod, SHIFT, "left" }), hl.dsp.window.move({ direction = "left" }))
hl.bind(km({ mainMod, SHIFT, "right" }), hl.dsp.window.move({ direction = "right" }))
hl.bind(km({ mainMod, SHIFT, "up" }), hl.dsp.window.move({ direction = "up" }))
hl.bind(km({ mainMod, SHIFT, "down" }), hl.dsp.window.move({ direction = "down" }))


require("config.monitors")
require("config.workspaces")

-- Modes
hl.bind(km({ mainMod, SHIFT, "R" }), hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind(km({ "right" }), hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
    hl.bind(km({ "left" }), hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
    hl.bind(km({ "up" }), hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
    hl.bind(km({ "down" }), hl.dsp.window.resize({ x = 0, y = 10, relative = true }))

    hl.bind(km({ SHIFT, "right" }), hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
    hl.bind(km({ SHIFT, "left" }), hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
    hl.bind(km({ SHIFT, "up" }), hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
    hl.bind(km({ SHIFT, "down" }), hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

    hl.bind(km({ "escape" }), hl.dsp.submap("reset"))
end)


hl.bind(km({ mainMod, SHIFT, "L" }), hl.dsp.submap("lorem"))
hl.define_submap("lorem", function()
    hl.bind(km({ mainMod, "Q" }), hl.dsp.exec_cmd("lorem.sh -wc"))
    hl.bind(km({ mainMod, "W" }), hl.dsp.exec_cmd("lorem.sh -s"))
    hl.bind(km({ mainMod, "E" }), hl.dsp.exec_cmd("lorem.sh -p"))

    hl.bind(km({ "escape" }), hl.dsp.submap("reset"))
end)


-- Example special workspace (scratchpad)
hl.bind(km({ mainMod, "S" }),  hl.dsp.workspace.toggle_special("magic"))
hl.bind(km({ mainMod, SHIFT, "S" }), hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(km({ mainMod, "mouse_down" }), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(km({ mainMod, "mouse_up" }), hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(km({ mainMod, "mouse:272" }), hl.dsp.window.drag(), { mouse = true })
hl.bind(km({ mainMod, "mouse:273" }), hl.dsp.window.resize(), { mouse = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/configuring/core/rules/

-- Example window rules that are useful

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


-- CUSTOM CONFIG
hl.bind(km({ "XF86AudioRaiseVolume" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --output-volume raise --max-volume 100"))
hl.bind(km({ "XF86AudioLowerVolume" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --output-volume lower --max-volume 100"))
hl.bind(km({ "XF86AudioMute" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --output-volume mute-toggle"))
hl.bind(km({ "XF86AudioMicMute" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --input-volume mute-toggle"))
hl.bind(km({ "XF86MonBrightnessDown" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --brightness lower"))
hl.bind(km({ "XF86MonBrightnessUp" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --brightness raise"))
hl.bind(km({ "XF86AudioPlay" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --playerctl play-pause"))
hl.bind(km({ "XF86AudioNext" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --playerctl next"))
hl.bind(km({ "XF86AudioPrev" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --playerctl previous"))
hl.bind(km({ mainMod, "F1" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --playerctl play-pause"))
hl.bind(km({ mainMod, "F3" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --playerctl next"))
hl.bind(km({ mainMod, "F2" }), hl.dsp.exec_cmd("swayosd-client-single-monitor --playerctl previous"))
hl.bind(km({ "XF86PowerOff" }), hl.dsp.exec_cmd("hyprlock"))
hl.bind(km({ mainMod, "ESCAPE" }), hl.dsp.exec_cmd("hypr-adjust"))

