return {
	"anuvyklack/hydra.nvim",
	config = function()
		local Hydra = require("hydra")
		local dap = require("dap")

		-- Options module
		local options_hints = [[
^ ^        Options
^
_v_ %{ve} virtual edit
_i_ %{list} invisible characters  
_s_ %{spell} spell
_w_ %{wrap} wrap
_c_ %{cul} cursor line
_n_ %{nu} number
_r_ %{rnu} relative number
^
     ^^^^              _<Esc>_
]]
		local options_hydra = Hydra({
			name = "+options",
			hint = options_hints,
			config = {
				color = "amaranth",
				invoke_on_body = true,
				hint = { border = "solid", position = "middle" },
			},
			mode = { "n", "x" },
			body = "<leader>v",
			heads = {
				{
					"n",
					function()
						if vim.o.number == true then
							vim.cmd([[set nonumber]])
						else
							vim.cmd([[set number]])
						end
					end,
					{ desc = "Number" },
				},
				{
					"r",
					function()
						if vim.o.relativenumber == true then
							vim.cmd([[set norelativenumber]])
						else
							vim.cmd([[set number relativenumber]])
						end
					end,
					{ desc = "Relative Number" },
				},
				{
					"v",
					function()
						if vim.o.virtualedit == "all" then
							vim.cmd([[set virtualedit=block]])
						else
							vim.cmd([[set virtualedit=all]])
						end
					end,
					{ desc = "Virtual Edit" },
				},
				{
					"i",
					function()
						if vim.o.list == true then
							vim.cmd([[set nolist]])
						else
							vim.cmd([[set list]])
						end
					end,
					{ desc = "Show Invisible" },
				},
				{
					"s",
					function()
						if vim.o.spell == true then
							-- vim.cmd([[set nospell]])
							vim.cmd("autocmd BufRead,BufNewFile * setlocal spell spelllang=en_us")
						else
							vim.cmd([[set spell]])
						end
					end,
					{ exit = true, desc = "Spell" },
				},
				{
					"w",
					function()
						if vim.o.wrap == true then
							vim.cmd([[set nowrap]])
						else
							vim.cmd([[set wrap]])
						end
					end,
					{ desc = "Wrap" },
				},
				{
					"c",
					function()
						if vim.o.cursorline == true then
							vim.cmd([[set nocursorline]])
						else
							vim.cmd([[set cursorline]])
						end
					end,
					{ desc = "Cursor Line" },
				},
				{ "<Esc>", nil, { exit = true, nowait = true } },
			},
		})

		-- Debugger module
		local debugger_hints = [[
                Debug

    ^ ^Step^ ^ ^           ^ ^     Action
    ^ ^ ^ ^ ^ ^            ^ ^  
    ^ ^back^ ^ ^           ^_t_ Toggle breakpoint  
     ^ ^_K_^ ^              _T_ Clear breakpoints  
out _H_ ^ ^ _L_ into        _c_ Continue
    ^ ^ _J_ ^ ^             _x_ Terminate
    ^ ^over ^ ^           ^^_r_ Open repl
    ^ ^     ^ ^           ^^_l_ Run last
^
_<Esc>_               _<Enter>_: DapUI
]]
		local debugger_hydra = Hydra({
			name = "+debug",
			hint = debugger_hints,
			config = {
				color = "pink",
				invoke_on_body = true,
				hint = { border = "solid", position = "top-right" },
			},
			mode = { "n" },
			body = "<leader>d",
			heads = {
				{
					"H",
					function()
						dap.step_out()
					end,
					{ desc = "step out" },
				},
				{
					"J",
					function()
						dap.step_over()
					end,
					{ desc = "step over" },
				},
				{
					"K",
					function()
						dap.step_back()
					end,
					{ desc = "step back" },
				},
				{
					"L",
					function()
						dap.step_into()
					end,
					{ desc = "step into" },
				},
				{
					"t",
					function()
						dap.toggle_breakpoint()
					end,
					{ desc = "toggle breakpoint" },
				},
				{
					"T",
					function()
						dap.clear_breakpoints()
					end,
					{ desc = "clear breakpoints" },
				},
				{
					"c",
					function()
						dap.continue()
					end,
					{ desc = "continue" },
				},
				{
					"x",
					function()
						dap.terminate()
					end,
					{ desc = "terminate" },
				},
				{
					"r",
					function()
						dap.repl.open()
					end,
					{ exit = true, desc = "open repl" },
				},
				{ "<Esc>", nil, { exit = true, nowait = true } },
				{
					"<Enter>",
					function()
						require("dapui").toggle()
					end,
				},
				{
					"l",
					function()
						dap.run_last()
					end,
					{ desc = "Run last" },
				},
			},
		})
	end,
}
