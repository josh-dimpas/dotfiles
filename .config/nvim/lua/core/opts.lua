-- Set [Space] as <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Relative Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab Width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- Put clipboard on yank
vim.opt.clipboard = "unnamedplus"

-- Make commands run faster (i think)
vim.opt.timeoutlen = 300

-- Auto update buffers when updated by other programs
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
})

