local gl = require("galaxyline")
local icons = require("nvim-nonicons")
local has_lsp_status, lsp_status = pcall(require, "lsp-status")
local colors = {
        bg = "#312C3E",
        yellow = "#e7de79",
        cyan = "#a1efe4",
        darkblue = "#13111b",
        green = "#67e480",
        orange = "#FFB86C",
        purple = "#988bc7",
        magenta = "#ff79c6",
        grey = "#c0c0c0",
        blue = "#78d1e1",
        red = "#ed4556",
}
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = { "NvimTree" }

gls.left[1] = {
        Separator = {
                provider = function()
                        return "// "
                end,
                highlight = { colors.purple, colors.darkblue },
        },
}

gls.left[2] = {
        ViMode = {
                provider = function()
                        local mode_letters = {
                                n = "NORMAL ",
                                i = "INSERT ",
                                [""] = "V-BLOCK",
                                c = "COMMAND",
                                cv = "VIM EX ",
                                ce = "EX     ",
                                v = "VISUAL ",
                                V = "V-LINE",
                                s = "SELECT ",
                                S = "S-LINE ",
                                [""] = "S-BLOCK",
                                ic = "INSCOMP",
                                ix = "INSCOMP",
                                R = "REPLACE",
                                Rc = "R-COMPL",
                                Rx = "R-COMPL",
                                Rv = "R-VIRTL",
                                r = "PROMPT ",
                                rm = "PROMPT ",
                                ["r?"] = "CONFIRM",
                                t = "TERMNAL",
                        }
                        return mode_letters[vim.fn.mode()]
                end,
                separator = " ",
                highlight = { colors.blue, colors.darkblue },
                separator_highlight = { colors.darkblue, colors.darkblue },
        },
}
gls.left[3] = {
        FileSize = {
                provider = "FileSize",
                condition = condition.buffer_not_empty,
                highlight = { colors.fg, colors.darkblue },
        },
}

gls.left[4] = {
        GitIcon = {
                provider = function()
                        return ""
                end,
                condition = condition.check_git_workspace,
                highlight = { colors.green, colors.darkblue },
                separator = " ",
                separator_highlight = { colors.bg, colors.darkblue },
        },
}

gls.left[5] = {
        GitBranch = {
                provider = "GitBranch",
                separator = " ",
                condition = condition.check_git_workspace,
                highlight = { colors.green, colors.darkblue },
                separator_highlight = { colors.bg, colors.darkblue },
        },
}

gls.left[6] = {
        DiagnosticError = {
                provider = "DiagnosticError",
                icon = " " .. icons.get("stop") .. " ",
                highlight = { colors.red, colors.bg },
        },
}

gls.left[7] = {
        DiagnosticWarn = {
                provider = "DiagnosticWarn",
                icon = " " .. icons.get("alert") .. " ",
                highlight = { colors.yellow, colors.bg },
        },
}

gls.left[8] = {
        DiagnosticHint = {
                provider = "DiagnosticHint",
                icon = " " .. "?" .. " ",
                highlight = { colors.cyan, colors.bg },
        },
}

gls.left[9] = {
        DiagnosticInfo = {
                provider = "DiagnosticInfo",
                icon = " " .. "i" .. " ",
                highlight = { colors.blue, colors.bg },
        },
}

gls.mid[1] = {
        FileIcon = {
                provider = "FileIcon",
                condition = condition.buffer_not_empty,
                highlight = {
                        require("galaxyline.provider_fileinfo").get_file_icon_color,
                        colors.bg,
                },
        },
}

gls.mid[2] = {
        FileName = {
                provider = { "FileName" },
                condition = condition.buffer_not_empty,
                highlight = { colors.magenta, colors.bg },
        },
}
gls.right[1] = {
        ServerProgress = {
                provider = function()
                        if has_lsp_status then
                                local buffer_clients = vim.lsp.buf_get_clients(0)
                                local buffer_client_set = {}
                                for _, v in pairs(buffer_clients) do
                                        buffer_client_set[v.name] = true
                                end
                                local all_messages = lsp_status.messages()
                                for _, msg in ipairs(all_messages) do
                                        if msg.name and buffer_client_set[msg.name] then
                                                local contents = ""
                                                if msg.progress then
                                                        contents = msg.title
                                                        if msg.message then
                                                                contents = contents
                                                                        .. " "
                                                                        .. msg.message
                                                        end
                                                        if msg.percentage then
                                                                contents = contents
                                                                        .. " ("
                                                                        .. msg.percentage
                                                                        .. ")"
                                                        end
                                                elseif msg.status then
                                                        contents = msg.content
                                                else
                                                        contents = msg.content
                                                end
                                                return " " .. contents .. " "
                                        end
                                end
                        else
                                return ""
                        end
                end,
                highlight = { colors.orange, colors.bg },
        },
}
gls.right[2] = {
        DiffAdd = {
                provider = "DiffAdd",
                condition = condition.hide_in_width,
                icon = icons.get("diff-added") .. " ",
                highlight = { colors.green, colors.bg },
        },
}
gls.right[3] = {
        DiffModified = {
                provider = "DiffModified",
                condition = condition.hide_in_width,
                icon = icons.get("diff-modified") .. " ",
                highlight = { colors.orange, colors.bg },
        },
}
gls.right[4] = {
        DiffRemove = {
                provider = "DiffRemove",
                condition = condition.hide_in_width,
                icon = icons.get("diff-removed") .. " ",
                highlight = { colors.red, colors.bg },
        },
}
gls.right[5] = {
        LineInfo = {
                separator = " ",
                provider = "LineColumn",
                highlight = { colors.fg, colors.bg },
                separator_highlight = { colors.bg, colors.bg },
        },
}

gls.right[6] = {
        FileEncode = {
                provider = "FileEncode",
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.green, colors.bg },
        },
}

gls.right[7] = {
        FileFormat = {
                provider = "FileFormat",
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.green, colors.bg },
        },
}
gls.right[8] = {
        PerCent = {
                provider = "LinePercent",
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.fg, colors.bg, "bold" },
        },
}

gls.right[9] = {
        RainbowBlue = {
                provider = function()
                        return " ▊"
                end,
                highlight = { colors.blue, colors.bg },
        },
}

gls.short_line_left[1] = {
        BufferType = {
                provider = "FileTypeName",
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.blue, colors.bg, "bold" },
        },
}

gls.short_line_left[2] = {
        SFileName = {
                provider = "SFileName",
                condition = condition.buffer_not_empty,
                highlight = { colors.fg, colors.bg, "bold" },
        },
}

gls.short_line_right[1] = {
        BufferIcon = { provider = "BufferIcon", highlight = { colors.fg, colors.bg } },
}
