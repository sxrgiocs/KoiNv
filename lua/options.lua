local set = vim.opt
local let = vim.g

set.encoding = "utf-8"
set.fileencodings = "utf-8"

set.clipboard = 'unnamedplus'

set.termguicolors = true

set.cursorline = true

let.mapleader = " "

-- Indenting
set.expandtab = true
set.shiftwidth = 4      -- number of spaces which compose the 'tab' action
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4

set.smartcase = true

set.wrap = false

-- lines
set.relativenumber = true
set.nu = true
set.scrolloff = 8

-- other
set.hlsearch = false
set.incsearch = true
set.hidden = true
set.signcolumn="yes"

-- history
set.swapfile = false
set.backup = false
set.undodir = "/home/sergio/.nvim/undodir"
set.undofile = true

-- set linewidth for certain files
vim.api.nvim_exec([[
    autocmd BufRead,BufNewFile *.tex setlocal textwidth=120
    ]],false)

-- set spelling check
vim.api.nvim_exec([[
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.rmd setlocal spell
    autocmd BufRead,BufNewFile *.txt setlocal spell
    autocmd BufRead,BufNewFile *.tex setlocal spell
    ]], false)

set.spelllang = "en_us"

-- languagetool
let.languagetool_lang = "en-US"
let.languagetool_jar = "/usr/share/java/languagetool/languagetool-commandline.jar" -- if languagetool is installed from the AUR is always this path

-- UltiSnips
let.UltiSnipsExpandTrigger = "<nop>"
let.UltiSnipsJumpForwardTrigger = "<c-j>"
let.UltiSnipsJumpBackwardTrigger = "<c-k>"
let.UltiSnipsRemoveSelectModeMappings = 0

-- LaTeX PDF previews
let.livepreview_engine = "pdflatex"
let.livepreview_previewer = "zathura"

-- LaTeX settings (I do not how how to write 'au' in lua bc I'm stupid)
vim.api.nvim_exec([[
    autocmd BufNewFile,BufRead *.tex set nocursorline 
    autocmd BufNewFile,BufRead *.tex set nornu
    autocmd BufNewFile,BufRead *.tex set number 
    autocmd BufNewFile,BufRead *.tex let g:loaded_matchparen=1 
    autocmd BufNewFile,BufRead *.tex set noshowmatch 
    ]], false)

set.conceallevel = 1
--let.tex_conceal = "abdmg"
let.vimtex_view_method = "zathura"

set.showtabline = 2
