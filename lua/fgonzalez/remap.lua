vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>fv", ":NvimTreeToggle<CR>")

-- autocompletado de parentesis y comillas
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", '"', '""<Left>')
vim.keymap.set("i", '(', '()<Left>')
vim.keymap.set("i", '[', '[]<Left>')
vim.keymap.set("i", '{', '{}<Left>')

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>fs", ":split<CR><C-w>j:ter<CR><C-w>k")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "<nop>")
