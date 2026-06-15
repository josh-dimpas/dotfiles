local opts = { noremap = true, silent = true }

local km = vim.keymap.set
local builtin = require('telescope.builtin')

-- Remove default behavior of space
km('', '<Space>', '<Nop>', opts)

-- Remove 'search' highlight when pressing normal mode 
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<C-[>', ':noh<CR>', { silent = true })

-- Save file
km('', '<C-s>', ':w<CR>', opts)

-- Make 'x' remove character without copy to register
km('n', 'x', '"_x', opts)

-- Navigate through buffers
km('n', '<Tab>', ':bnext<cr>', opts) -- Next
km('n', '<S-Tab>', ':bprevious<cr>', opts) -- Previous

-- <Space><Space> to open find_files
km('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })

-- <Space>rg Live grep 
km('n', '<leader>rg', builtin.live_grep, { desc = 'Telescope live grep' })


-- Advance New File
km("n", "<C-n>", ":Telescope file_browser hidden=true files=false depth=false<CR>", { noremap=true })

-- Manual command to delete current file
local km = vim.keymap.set

-- Close current buffer
km("n", "<C-w>", ":bdelete<CR>", { noremap = true, silent = true })
km("v", "<C-w>", ":bdelete<CR>", { noremap = true, silent = true })

-- Comment out lines
km("n", "<C-_>", "gcc", { remap = true })
km("v", "<C-_>", "gcc", { remap = true })

-- Delete current file
 km("n", "<leader>df", function()
     local fb = require("telescope").extensions.file_browser
     fb.filebrowser({
         path = "%:p:h",
         select_buffer = true,
         initial_mode = "normal"
     })
 end, { desc = "Delete current file via File Browser" })

-- Map Ctrl + . to code actions
km({'n', 'i'}, '<C-.>', vim.lsp.buf.code_action, { noremap = true, silent = true })
