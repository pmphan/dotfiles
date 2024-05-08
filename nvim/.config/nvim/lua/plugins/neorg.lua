return {
    {
        "vhyrro/luarocks.nvim", name = "luarocks", priority = 1000,
        opts = { rocks = { "magick" } }
    },
    {
        "nvim-neorg/neorg", name = "neorg",
        version = "*", dependencies = { "luarocks" },
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {
                    config = {
                        icon_preset = "diamond",
                        icons = {
                            ordered = {
                                icons = { "1", "a", "ⅰ", "1", "a", "ⅰ" }
                            }
                        }
                    }
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = { main = "~/Documents" },
                        default_workspace = main
                    }
                },
                ["core.summary"] = {}
            }
        }
    }
}
