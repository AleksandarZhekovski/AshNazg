-- --- Monitors ---
-- -- Laptop display
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })

-- -- Dock outputs
-- - HDMI
hl.monitor({ output = "DP-5", mode = "preferred", position = "0x-1080", scale = 1 })

-- -- Generic
hl.monitor({ output = "", mode = "preferred", position = "0x-1080", scale = 1 })

-- --- Input ---
hl.config({
  input = {
    kb_layout = "us,bg",
    kb_variant = ",phonetic",
    follow_mouse = 1,
    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    touchpad = {
        disable_while_typing = true;
    }
  }
})
    
-- --- Colors ---
color1 = "rgba(ff9900ee)"

-- --- Sources ---
require("common/env")
require("common/styling")
require("common/binds")
require("common/misc")

-- --- Overwrites ---
