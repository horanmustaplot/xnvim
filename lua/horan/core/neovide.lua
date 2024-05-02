--- @defgroup neovide settings
--- @{
if vim.g.neovide then
	--- @defgroup Padding
	--- @{
	local padding_style = "ml" -- There's three styles nyoom, lap, ml and xl.

	if padding_style == "nyoom" then
		vim.g.neovide_padding_top = 45
		vim.g.neovide_padding_left = 40
		vim.g.neovide_padding_right = 38
		vim.g.neovide_padding_bottom = 20
	elseif padding_style == "lap" then
		vim.g.neovide_padding_top = 10
		vim.g.neovide_padding_left = 10
		vim.g.neovide_padding_right = 10
		vim.g.neovide_padding_bottom = 10
	elseif padding_style == "ml" then
		vim.g.neovide_padding_top = 25
		vim.g.neovide_padding_left = 20
		vim.g.neovide_padding_right = 20
		vim.g.neovide_padding_bottom = 20
	elseif padding_style == "xl" then
		vim.g.neovide_padding_top = 45
		vim.g.neovide_padding_left = 40
		vim.g.neovide_padding_right = 40
		vim.g.neovide_padding_bottom = 40
	end

	--- @{

	vim.g.neovide_cursor_vfx_mode = "ripple" -- Cursor animations mode

	-- NOTE: Uncomment to disable animations

	-- vim.g.neovide_cursor_animation_length = 0    -- Cursor
	-- vim.g.neovide_scroll_animation_length = 0    -- Scrolling
	-- vim.g.neovide_scroll_animation_far_lines = 0 -- Scrolling

	--- NOTE: Uncomment to turn on transparency

	-- vim.g.neovide_transparency = 0.85

	--- @defgroup Neovide scaling
	--- @{
	local map = vim.keymap.set

	local function neovideScale(amount)
		local temp = vim.g.neovide_scale_factor + amount

		if temp < 0.5 then
			return
		end

		vim.g.neovide_scale_factor = temp
	end

	map("n", "<C-=>", function() -- Ctrl + - : Increase scaling
		neovideScale(0.1)
	end)

	map("n", "<C-->", function() -- Ctrl + + : Decrease scaling
		neovideScale(-0.1)
	end)
	--- @}

	neovideScale(-0.04)

	--- NOTE: Hide mouse while typing

	-- vim.cmd("let g:neovide_hide_mouse_when_typing = 1") -- This one is already
	-- working using hyprland settings, so no need for this one here.
end

--- @}
