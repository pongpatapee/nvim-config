return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        config = function()
            require 'nvim-treesitter.configs'.setup {

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                -- List of parsers to ignore installing (or "all")
                -- ignore_install = { "javascript" },
                ignore_install = {},

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                indent = { enable = true },
                highlight = { enable = true },

                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = {
                    "bash",
                    "c",
                    "diff",
                    "html",
                    "javascript",
                    "jsdoc",
                    "json",
                    "jsonc",
                    "lua",
                    "luadoc",
                    "luap",
                    "markdown",
                    "markdown_inline",
                    "printf",
                    "python",
                    "query",
                    "regex",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                },

            }
        end
    }
}
