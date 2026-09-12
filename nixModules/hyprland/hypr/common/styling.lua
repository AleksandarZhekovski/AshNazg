hl.config({
  general = { 
    border_size = 2,
    gaps_in = 5,
    gaps_out = 0,

    col = {
      active_border = color1,
      inactive_border = "rgba(595959ee)",
    },

    layout = "dwindle",
    no_focus_fallback = true,
    resize_on_border = true,
    extend_border_grab_area = 10,
  },

  decoration = {
    rounding = 0,
    active_opacity = 1.0,
    inactive_opacity = 1,

    blur = {
      enabled = false,
      size = 1,
      passes = 1,
	    noise = 0.001,
	    contrast = 0.95,
	    brightness = 0.9,
    }
    
  },
  animations = {
    enabled = false,
        
    -- bezier = myTestBerzier, 0.25, 1, 0.5, 1 
    -- bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    --
    -- animation = windows, 1, 7, myBezier
    -- animation = windowsOut, 1, 7, default, popin 90%
    -- animation = border, 1, 10, default
    -- animation = borderangle, 1, 8, default
    -- animation = fade, 1, 7, default
    -- animation = workspaces, 1, 8, myTestBerzier, slide
    
  },

  dwindle = {
    preserve_split = true --# you probably want this
  }
})
