require("lazy").setup({{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "c++", "vim", "vimdoc", "html", "python", "lua", "doxygen" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}})
