return {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    }, 
    config = function() 
      require("nvim-possession").setup({
        sessions = {
            sessions_path = "/home/wandoka/.config/nvim/sessions/", -- folder to look for sessions, must be a valid existing path
            sessions_icon = "" --getting rid of stupid emoji everywhere in this plugin
        },

        autoload = false, -- whether to autoload sessions in the cwd at startup
        autosave = true, -- whether to autosave loaded sessions before quitting
        autoswitch = {
            enable = true, -- whether to close all of the previous buffers on switch
        },

        save_hook = nil, -- callback, function to execute before saving a session
                        -- useful to update or cleanup global variables for example
        post_hook = nil, -- callback, function to execute after loading a session
                        -- useful to restore file trees, file managers or terminals
                        -- function()
                        --     require('FTerm').open()
                        --     require("nvim-tree.api").tree.toggle()
                        -- end

        ---@type possession.Hls
        fzf_hls = { -- highlight groups for the sessions and preview windows
            normal = "Normal",
            preview_normal = "Normal",
            border = "Todo",
            preview_border = "Constant",
        },
        ---@type possession.Winopts
        fzf_winopts = {
            -- any valid fzf-lua winopts options, for instance
            width = 0.5,
            preview = {
                vertical = "right:30%"
            }
        },
      })
    end
}

