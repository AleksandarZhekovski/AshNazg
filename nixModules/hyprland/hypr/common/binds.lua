local mainMod = "SUPER"
local mainModShift = "SUPER+SHIFT"
-- local mainModControl = "SUPER + CONTROL"

-- ---------------
-- --- General ---
-- ---------------
hl.bind(mainMod .. "+RETURN", hl.dsp.exec_cmd("uwsm app -T"))
hl.bind(mainModShift .. "+Q", hl.dsp.window.close())

-- -- QWERTY
-- Q
hl.bind(mainMod .. "+W", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"))
-- E
-- R
-- T
-- Y
hl.bind(mainMod .. "+U", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
-- I
hl.bind(mainMod .. "+O", hl.dsp.window.float({action = "toggle"}))
-- P
hl.bind(mainMod .. "+R", hl.dsp.exec_cmd("tofi-run | xargs uwsm-app --"))
-- A
-- S
-- D
hl.bind(mainMod .. "+F", hl.dsp.window.fullscreen({action = "toggle"}))
-- G
-- H,J,K,L reserved for focus
-- Z
-- X
-- V pobably want clipboard manager here
-- B
-- N
hl.bind(mainMod .. "+M", hl.dsp.dpms({action = "toggle"}))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. "+PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- --------------------------------
-- --- Window / Workspace focus ---
-- --------------------------------
hl.bind(mainMod .. "+left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "+right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "+up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "+down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. "+h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "+l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "+k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "+j",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainModShift .. "+h",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainModShift .. "+l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainModShift .. "+k",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainModShift .. "+j",  hl.dsp.window.move({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,        hl.dsp.focus({ workspace = i}))
    hl.bind(mainModShift .. "+" .. key,     hl.dsp.window.move({ workspace = i }))
end

-- --------------------
-- --- Function bar ---
-- --------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brigtnessctl s 5$-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brigtnessctl s 5$+"))

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

-- - Erebor specific 12-09-26
hl.bind("XF86PickupPhone", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86HangupPhone", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86Favorites", hl.dsp.exec_cmd("playerctl next"))
