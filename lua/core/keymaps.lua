-- This keymaps focuses on working with splits instead of tabs

local api = vim.api -- for conciseness
local opts = { noremap = true, silent = true }

--NOTE: Splits philosophy focus keybindings

-- Opening splits
api.nvim_set_keymap("n", "<leader>hs", ":sp<CR>", opts)
api.nvim_set_keymap("n", "<leader>vs", ":vs<CR>", opts)

-- Moving between splits
api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", opts)
api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", opts)
api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", opts)
api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", opts)

-- Changing splits scalling
api.nvim_set_keymap("n", "<C-S-k>", "<C-W>+", opts)
api.nvim_set_keymap("n", "<C-S-j>", "<C-W>-", opts)
api.nvim_set_keymap("n", "<C-S-h>", "<C-W>>", opts)
api.nvim_set_keymap("n", "<C-S-l>", "<C-W><", opts)

-- Opened buffers menu
api.nvim_set_keymap("n", "<leader><leader>", ":Telescope buffers<CR>", opts)

-- Others

api.nvim_set_keymap("n", "<leader>a", ":AerialOpen<CR>", opts) -- Outliner
api.nvim_set_keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>", opts) -- Renaming

----

api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
api.nvim_set_keymap("n", "<leader>x", ":Neotree toggle<CR>", opts)

api.nvim_set_keymap("n", "<C-enter>", ":Lspsaga term_toggle<CR>", opts) -- Open terminal

-- Dap
api.nvim_set_keymap("n", "<leader>i", ":lua require('dapui').toggle()<CR>", opts)
api.nvim_set_keymap("n", "<leader>bp", ":DapToggleBreakpoint<CR>", opts)

api.nvim_set_keymap("n", "<C-;>", "<cmd>Lspsaga hover_doc<CR>", opts)
api.nvim_set_keymap("n", "<C-p>", "<cmd>Lspsaga peek_definition<cr>", opts)

api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)
api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts)

-- Better pasting
api.nvim_set_keymap("x", "<leader>p", '"_dP', opts)

-- Finding
api.nvim_set_keymap("n", "n", "nzz", opts)
api.nvim_set_keymap("n", "N", "Nzz", opts)

api.nvim_set_keymap("n", "<leader>ll", ":lua require('lsp_lines').toggle()<CR>", opts)

api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", opts)

api.nvim_set_keymap("n", "<space>fb", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)

api.nvim_set_keymap("n", "<leader>zn", ":TZAtaraxis<CR>", opts) -- Zen mode

api.nvim_set_keymap("n", "<C-;>", ":Neorg journal today<CR>", opts) -- Neorg

-- Extra
function Get_visual_selection()
	local a_orig = vim.fn.getreg("a")
	local mode = vim.fn.mode()
	if mode ~= "v" and mode ~= "V" then
		vim.cmd([[normal! gv]])
	end
	vim.cmd([[silent! normal! "aygv]])
	local text = vim.fn.getreg("a")
	vim.fn.setreg("a", a_orig)
	return text
end

function Open_selection_with_xdg_open()
	vim.cmd("!xdg-open " .. '"' .. Get_visual_selection() .. '"' .. " & disown")
end

api.nvim_set_keymap("v", "O", ":lua Open_selection_with_xdg_open()<CR>", opts)
