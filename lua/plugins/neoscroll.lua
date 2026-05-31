return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      easing_function = "quadratic", 
      hide_cursor = true,           
      stop_eof = true,              
      cursor_scrolls_alone = true,  
    })
  end
}
