-- --- Monitors ---
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })
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
    };

    -- accel_profile = "custom 0 1.0 1.0"
    -- - as per the wayland libinput wiki 
    -- - '''
    -- - An example is the curve of 0.0, 1.0 with a step of 1.0. This curve is the 
    -- - equivalent of the flat acceleration profile with any input speed N mapped 
    -- - to the same pointer speed N. The curve 1.0, 1.0 neutralizes any input speed 
    -- - differences and results in a fixed pointer speed.
    -- - '''
  }
})
    
-- --- Colors ---
color1 = "rgba(ff9900ee)"

-- --- Sources ---
require("./common/*")

-- --- Overwrites ---
