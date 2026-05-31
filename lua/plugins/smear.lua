return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Smear dynamics
    stiffness = 0.8,
    trailing_stiffness = 0.6,
    stiffness_insert_mode = 0.7,
    trailing_stiffness_insert_mode = 0.7,
    
    -- Elasticity and bounciness (increase for more trail, decrease for less)
    damping = 0.95,
    damping_insert_mode = 0.95,
    
    -- Hide target hack to only see the trail
    never_draw_over_target = true,
    hide_target_hack = false,
  }
}
