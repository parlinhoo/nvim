local harpoon = require('harpoon')
harpoon:setup({})

-- se bugea si se inicia con una lista guardada
harpoon:list():clear()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-k>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)
