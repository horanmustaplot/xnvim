local g = vim.g -- To minimize stuff
local map = vim.keymap.set

if g.neovide then
	-- Scalling function
	local function neovideScale(amount)
		local temp = g.neovide_scale_factor + amount
		if temp < 0.5 then
			return
		end
		g.neovide_scale_factor = temp
	end

	map("n", "<C-=>", function() -- Ctrl + - : Increase scaling
		neovideScale(0.1)
	end)

	map("n", "<C-->", function() -- Ctrl + + : Decrease scaling
		neovideScale(-0.1)
	end)

	neovideScale(-0.1) -- Start with minimizing scalling a little bit.

	-- Neovide settings
	g.neovide_fullscreen = false -- Start with fullscreen
	g.neovide_cursor_vfx_mode = "pixiedust" -- Cursor animations mode

	-- Padding style
	local padding_style = "xl"
	if padding_style == "nyoom" then
		g.neovide_padding_top = 45
		g.neovide_padding_left = 40
		g.neovide_padding_right = 38
		g.neovide_padding_bottom = 20
	elseif padding_style == "lap" then
		g.neovide_padding_top = 10
		g.neovide_padding_left = 10
		g.neovide_padding_right = 10
		g.neovide_padding_bottom = 10
	elseif padding_style == "xl" then
		g.neovide_padding_top = 20
		g.neovide_padding_left = 20
		g.neovide_padding_right = 20
		g.neovide_padding_bottom = 20
	end
end
