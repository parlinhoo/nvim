local vscode = require("vscode")

vim.keymap.set("n", "<leader>fv", function() vscode.action("workbench.view.explorer") end)

vim.keymap.set('n', '<leader>ee', function() vscode.call("editor.action.marker.next") end)
vim.keymap.set('n', '<leader>ew', function() vscode.call("editor.action.marker.prev") end)
vim.keymap.set('n', '<leader>s', function() vscode.call("editor.action.rename") end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "<nop>")
