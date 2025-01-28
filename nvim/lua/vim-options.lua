--vim.opt.termguicolors = true
vim.wo.number = true
vim.opt.colorcolumn = "80"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
--TECLA LIDER
vim.g.mapleader = " "

--CTRL S 
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

--DAP
--vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
--vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue<CR>", { desc = "Continue" })


vim.keymap.set("n", "<leader>c", ":Copilot disable<CR>", {})
vim.keymap.set("n", "<leader>C", ":Copilot enable<CR>", {})


--config de dashboard

vim.keymap.set("n", "V", function()
  if vim.api.nvim_win_get_config(0).relative == "" then -- Not inside floating window
    vim.diagnostic.open_float() -- Open diagnostic in floating window
    vim.diagnostic.open_float() -- Another call jumps into the floating window
  else -- Inside a floating window
    vim.api.nvim_win_close(0, false) -- Or you can press "q" in the floating window
  end
end, { desc = "[t] Toggle diagnostic floating window" })

