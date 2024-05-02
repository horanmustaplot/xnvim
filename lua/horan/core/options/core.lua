local o = vim.opt -- for conciseness

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

-- Set space as the leader key
vim.g.mapleader = " "

-- GUI o.ons
vim.o.list = true
o.fillchars = {
	eob = " ",
	vert = " ",
	horiz = " ",
	diff = "╱",
	foldclose = "",
	foldsep = " ", -- │
	foldopen = "",
	fold = " ",
	msgsep = "─",
}

o.listchars = {
	tab = "│ ",
	trail = "·",
	nbsp = "␣",
	precedes = "«",
	extends = "»",
}

o.scrolloff = 2
o.guifont = "Liga SFMono Nerd Font:h10"

-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
o.tabstop = 3 -- 2 spaces for tabs (prettier default)
o.shiftwidth = 3 -- 2 spaces for indent width
o.expandtab = true -- expand tab to spaces
o.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
o.wrap = false -- disable line wrapping

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
o.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
o.termguicolors = true
o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
o.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
o.swapfile = false

-- Enable mouse events
if vim.fn.has("mouse") == 1 then
	vim.o.mouse = "a"
end

-- Hide status line in the buttom

vim.cmd("let s:hidden_all = 1")
vim.cmd("set noshowmode")
vim.cmd("set noruler")
vim.cmd("set laststatus=0")
vim.cmd("set noshowcmd")
