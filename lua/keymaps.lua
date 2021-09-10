local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- VIM hard mode
--map("n", "<Left>", "", {noremap=true})
--map("i", "<Left>", "", {noremap=true})
--map("c", "<Right>", "", {noremap=true})
--map("n", "<Right>", "", {noremap=true})
--map("i", "<Right>", "", {noremap=true})
--map("c", "<Right>", "", {noremap=true})
--map("n", "<Up>", "", {noremap=true})
--map("i", "<Up>", "", {noremap=true})
--map("c", "<Up>", "", {noremap=true})
--map("n", "<Down>", "", {noremap=true})
--map("i", "<Down>", "", {noremap=true})
--map("c", "<Down>", "", {noremap=true})

-- Buffers
map("n", "<C-H>", ":bprev<CR>", {noremap=true})
map("n", "<C-L>", ":bnext<CR>", {noremap=true})

-- NVimTree
map("n", "<leader>t", ":NvimTreeToggle<CR>", {noremap = true})

-- Ranger
map("n", "<leader>r", ":Ranger<CR>", {})

map("n", "<C-z>", "<Nop>", {})

-- Resize splits
map("", "<leader>l", ":vertical resize +5<CR>", {})
map("", "<leader>h", ":vertical resize -5<CR>", {})
map("", "<leader>j", ":res -5<CR>", {})
map("", "<leader>k", ":res +5<CR>", {})

-- LaTeX preview
map("", "<leader>p", ":LLPStartPreview<CR>", {noremap=true})

-- Numbers
map("n", "<leader>n", ":set relativenumber!<CR>", {})

-- Toggle diagnostics

map("n", "<leader>d", ":ToggleDiag<CR>", {})

-- Telescope
map("n", "<leader>fb", ":Telescope buffers<CR>", {})
map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
map("n", "<leader>fgc", ":Telescope git_commits<CR>", {})
map("n", "<leader>fgs", ":Telescope git_status<CR>", {})
