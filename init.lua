-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
--vim.g.equalalways = false

-- para que funcione con vs code
if vim.g.vscode then
    require("vscodeconfig")
    require("vscodeafter")
else
    -- tamaño ventana split
    vim.opt.winheight = 32

    -- optionally enable 23-bit colour
    vim.opt.termguicolors = true

    require("fgonzalez")
    require("after")
end

