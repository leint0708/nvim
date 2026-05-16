local keymap = vim.keymap.set
vim.g.mapleader = " "
-- quit
keymap("n", "<leader>q", ":q<CR>",         { desc = "Quit" })

-- remove search highlighting
keymap("n", "<Esc>", ":nohlsearch<CR>",    { desc = "Clear search highlight" })

-- move cursor in insert mode
keymap("i", "<C-h>", "<Left>",             { desc = "Move cursor left" })
keymap("i", "<C-j>", "<Down>",             { desc = "Move cursor down" })
keymap("i", "<C-k>", "<Up>",               { desc = "Move cursor up" })
keymap("i", "<C-l>", "<Right>",            { desc = "Move cursor right" })

-- move between windows
keymap("n", "<C-h>", "<C-w>h",             { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j",             { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k",             { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l",             { desc = "Move to right window" })

-- keep cursor in the middle when scrolling
keymap("n", "<C-d>", "<C-d>zz",            { desc = "Scroll down (centered)" })
keymap("n", "<C-u>", "<C-u>zz",            { desc = "Scroll up (centered)" })

-- indent without losing selection
keymap("v", "<", "<gv",                    { desc = "Indent left" })
keymap("v", ">", ">gv",                    { desc = "Indent right" })

-- split
keymap("n", "<leader>sv", ":vsplit<CR>",   { desc = "Split vertical" })
keymap("n", "<leader>sh", ":split<CR>",    { desc = "Split horizontal" })
keymap("n", "<leader>sx", ":close<CR>",    { desc = "Close split" })

-- Lazy
keymap("n", "<leader>L", ":Lazy<CR>",      { desc = "Lazy" })

-- buffer
keymap("n", "<TAB>",       ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap("n", "<S-TAB>",     ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
keymap("n", "<leader>bd", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs == 1 then
    vim.cmd("enew | bd #")
  else
    vim.cmd("bd")
  end
end, { desc = "Close buffer" })
