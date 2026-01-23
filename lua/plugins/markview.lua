return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
        "saghen/blink.cmp"
    },
    config = function()
        require("markview").setup({
            experimental = {
                check_rtp = false,
            },
        })
    end
}
