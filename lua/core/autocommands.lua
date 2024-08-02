-- Saving the file view , folding...

vim.api.nvim_exec(
	[[
  hi! link ModeMsg Normal
  set laststatus=2
]],
	false
)

vim.cmd([[
    set viewoptions-=options
]])

vim.api.nvim_exec(
	[[
    augroup remember_folds
        autocmd!
        autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
        autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
    augroup END
]],
	false
)
