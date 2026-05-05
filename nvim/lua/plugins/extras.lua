return {
    { -- autopairs
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true
            })
        end
    },

    { -- toggleterm
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end
    },

    { -- ufo
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        },
        config = function()
            require("ufo").setup({
                provider_selector = function(bufnr, _, buftype)
                    if buftype ~= "" then return "" end

                    local function handleFallback(err, providerName)
                        if type(err) == "string" and err:match("UfoFallbackException") then
                            return require("ufo").getFolds(bufnr, providerName)
                        end
                        return require("promise").reject(err)
                    end

                    return function()
                        return require("ufo").getFolds(bufnr, "lsp")
                            :catch(function(err)
                                return handleFallback(err, "treesitter")
                            end)
                            :catch(function(err)
                                return handleFallback(err, "indent")
                            end)
                    end
                end,
            })
        end
    }
}
