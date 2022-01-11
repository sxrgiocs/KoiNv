local global_theme = "colors.themes/" .. require("colors.theme").ui.theme
local colors = require(global_theme)

local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        separator_style = "thick",
        --mappings = true,
        always_show_bufferline = true,
        numbers = function(opts)
            return string.format('%s', opts.raise(opts.id))
        end,
    },

    highlights = {
        fill = {
            guifg = colors.black,
            guibg = colors.black       -- rest of the bufferline
        },

        background = {                  -- color of the unselected buffers
            guifg = colors.black2,
            guibg = colors.black
        },

        -- buffers
        buffer_visible = {
            guifg = colors.light_grey,
            guibg = colors.background
        },

        buffer_selected = {
            guifg = colors.white,
            guibg = colors.background,
            gui = "bold"
        },

        -- tabs
        tab = {
            guifg = colors.white,
            guibg = colors.black
        },

        tab_selected = {
            guifg = colors.background,
            guibg = colors.background
        },

        tab_close = {
            guifg = colors.black,
            guibg = colors.black
        },

        indicator_selected = {
            guifg = colors.blue,
            guibg = colors.background
        },

        -- separators
        separator = {
            guifg = colors.black2,
            guibg = colors.black
        },

        separator_visible = {
            guifg = colors.background,
            guibg = colors.background
        },

        separator_selected = {
            guifg = colors.background,
            guibg = colors.background
        },

        -- modified
        modified = {
            guifg = colors.red,
            guibg = colors.black
        },

        modified_visible = {
            guifg = colors.black2,
            guibg = colors.background
        },

        modified_selected = {
            guifg = colors.yellow,
            guibg = colors.background
        },

        -- close buttons

    }
}

