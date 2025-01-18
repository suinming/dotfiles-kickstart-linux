require("config.lazy")

-- ============================================
-- local option
-- ============================================

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false

-- clipboard
vim.opt.clipboard:append({ "unnamedplus", "unnamed" })

-- obsidian.nvim
vim.opt.conceallevel = 1

-- ============================================
-- global option
-- ============================================

-- set up ufo.nvim unfold arrow
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- ============================================
-- keymap
-- ============================================

-- source current file
vim.keymap.set("n", "<space>x", "<cmd>source %<CR>")

-- ============================================
-- autocmd
-- ============================================

-- highlight when yanking (copying) text
--  try it with `yap` in normal mode
--  see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
