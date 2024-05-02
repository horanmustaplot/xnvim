--- NOTE: (It's for me) Don't use ALT + T Q E, or even ALT + 0 to 9, their taken for hypralnd.

local keymap = vim.keymap -- for conciseness
local api = vim.api

--- @defgroup Split philosopy plugins start
--- @{

-- Splits opening
keymap.set("n", "<leader>hs", "<cmd>sp<CR>")
keymap.set("n", "<leader>vs", "<cmd>vs<CR>")

-- File navigation
keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" }) -- Accessing files easly
api.nvim_set_keymap("n", "<leader>f", ":Neotree toggle<CR>", { noremap = true, silent = true }) -- File explorer

-- Outliner
keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>") -- Aerial
-- keymap.set("n", "<leader>a", "<cmd>Lspsaga outline<CR>") -- Lspsaga outline

-- Renaming
keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>")

-- Moving between splits
api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })

--- @defgroup Splits changing size
--- @{
-- Horizontal
api.nvim_set_keymap("n", "<C-S-k>", "<C-W>+", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-S-j>", "<C-W>-", { noremap = true, silent = true })

-- Vertical
api.nvim_set_keymap("n", "<C-S-h>", "<C-W>>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-S-l>", "<C-W><", { noremap = true, silent = true })

--- @}

--- @}

--- @defgroup Terminal
--- @{
keymap.set("n", "<leader>ft", "<cmd>Lspsaga term_toggle<cr>")
keymap.set("n", "<leader>ht", "<cmd>ToggleTerm direction=vertical<cr>")
keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<cr>")
--- @}

--- @defgroup Languages support
--- @{

--- @defgroup Debugging
--- @{
keymap.set("n", "<leader>i", "<cmd>lua require('dapui').toggle()<cr>")
keymap.set("n", "<leader>bp", "<cmd>DapToggleBreakpoint<cr>")
--- @}

--- @defgroup C/C++
--- @{
keymap.set("n", "<leader>q", "<cmd>CMakeClose<cr>")
keymap.set("n", "<leader>k", "<cmd>CMake build_and_run<cr>")
--- @}

--- @}

-- Saga
keymap.set("n", "<C-;>", "<cmd>Lspsaga hover_doc<CR>")
keymap.set("n", "<C-p>", "<cmd>Lspsaga peek_definition<cr>")

-- Moving faster
api.nvim_set_keymap("n", "<A-u>", "<C-u>zz", { noremap = true, silent = true }) --- FIX: put Ctrl instead of Alt
api.nvim_set_keymap("n", "<A-d>", "<C-d>zz", { noremap = true, silent = true }) --- FIX: put Ctrl instead of Alt

-- Replacing without losing what you've yanked
api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- Searching + centering the cursor
api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })

-- Toggle lsp lines + sometimes they sokes
api.nvim_set_keymap("n", "<leader>ll", ":lua require('lsp_lines').toggle()<CR>", { noremap = true, silent = true })

-- Open float window for seeing the world diagnostic
api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Zen mode
api.nvim_set_keymap("n", "<leader>zn", ":ZenMode<CR>", {})

-- Key mapping for saving file with Leader+w
api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })

api.nvim_set_keymap(
	"n",
	"<space>fb",
	"<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
	{ noremap = true }
)
