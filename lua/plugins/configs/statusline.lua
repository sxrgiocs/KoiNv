local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")
if not (present1 or present2) then
    return
end

local gls = gl.section

gl.short_line_list = {" "}

local global_theme = "colors.themes/" .. require("colors.theme").ui.theme
local colors = require(global_theme)

gls.left[1] = {
    BlockElement = {
        provider = function()
            return "▌"
        end,
        highlight = {colors.black, colors.black}
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
        local mode_color = {
                            n = colors.blue, i = colors.green2, v=colors.pink,
                            [''] = colors.pink, V=colors.pink,
                            c = colors.black2, no = colors.blue, s = colors.orange,
                            S=colors.orange, [''] = colors.orange,
                            ic = colors.yellow, R = colors.red, Rv = colors.red,
                            cv = colors.red, ce=colors.red, r = colors.cyan,
                            rm = colors.cyan, ['r?'] = colors.cyan,
                            ['!']  = colors.red, t = colors.black3
                        }

        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
            return ' '
    end,

    highlight = {colors.red, colors.black,'bold'},
    },
}

gls.left[3] = {
    RoundLeftElement = {
        provider = function()
            return ""
        end,
        highlight = {colors.black2, colors.black}
    }
}


gls.left[4] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. "/"
        end,
        highlight = {colors.white, colors.black2},
    }
}

gls.left[5] = {
    filename = {
        provider = function()
            local file_name = vim.fn.expand("%:t")
            return file_name
        end,
        highlight = {colors.white, colors.black2}
    }
}
--gls.left[5] = {
--    provider = function()
--        local filename = vim.fn.expand "%:t"
--        local extension = vim.fn.expand "%:e"
--        return filename .. "." .. extension
--    end,
--    highlight = {colors.white, colors.black2}
--}


local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[6] = {
    RoundRightElement = {
        provider = function()
            return " "
        end,
        highlight = {colors.black2, colors.black}
    }
}

gls.left[7] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.orange, colors.black}
    }
}

gls.left[8] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.black}
    }
}

gls.right[1] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.green, colors.black}
    }
}

gls.right[2] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.blue, colors.black}
    }
}

gls.right[3] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.red, colors.black},
    }
}

gls.right[5] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.gray, colors.black},
        separator = "| ",
        separator_highlight = {colors.gray2, colors.black, "bold"}
    }
}


gls.right[6] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.gray, colors.black, "bold"},
    }
}

gls.right[7] = {
    BlockElement = {
        provider = function()
            return "▌"
        end,
        highlight = {colors.black, colors.black}
    }
}

gls.right[11] = {
    RoundLeftElement = {
        provider = function()
            return ""
        end,
        highlight = {colors.black2, colors.black}
    }
}

gls.right[12] = {
  LineInfo = {
    provider = "LineColumn",
    highlight = {colors.gray2, colors.black2, "bold"},
  },
}

gls.right[13] = {
    RoundRightElement = {
        provider = function()
            return " "
        end,
        highlight = {colors.black2, colors.black}
    }
}

gls.right[14] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return " Top "
            elseif current_line == vim.fn.line("$") then
                return " Bottom "
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return "" .. result .. "% "
        end,
        highlight = {colors.orange, colors.black, "bold"},

    }
}
