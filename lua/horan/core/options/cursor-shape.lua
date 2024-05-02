-- Block cursor
vim.cmd([[
  augroup CursorShape
    autocmd!
    autocmd InsertEnter * set guicursor=n-v-c:block-Cursor/lCursor
  augroup END
]])
