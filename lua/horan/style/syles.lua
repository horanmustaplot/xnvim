local style = "def" -- set to `min`, `def` and `bitmap`

if style == "bitmap" then
	vim.opt.guifont = "cherry:h9"
	if vim.g.neovide then
		vim.g.neovide_cursor_animation_length = 0 -- Cursor
		vim.g.neovide_scroll_animation_length = 0 -- Scrolling
		vim.g.neovide_scroll_animation_far_lines = 0 -- Scrolling
	end
elseif style == "mini" then
	local o = vim.opt
	o.number = false
	o.relativenumber = false
	o.showtabline = 0
	o.signcolumn = "no"
	o.statusline = ""
	o.cmdheight = 1
	o.laststatus = 0
	o.showcmd = false
	o.showmode = false
	o.ruler = false
	o.numberwidth = 1
elseif style == "def" then
	vim.opt.guifont = "Liga SFMono Nerd Font:h9.5"
end
