function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^ryan') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

--function ReloadColorscheme()
--    vim.cmd('colorscheme gruvbox')  -- Change 'gruvbox' to your desired colorscheme
--end


--function _G.ReloadConfig()
--  for name,_ in pairs(package.loaded) do
--    if name:match('^ryan') then
--      package.loaded[name] = nil
--    end
--  end
--
--  dofile(vim.env.MYVIMRC)
--end

--vim.api.nvim_set_keymap('n', '<Leader>o', '<Cmd>lua ReloadConfig()<CR>', { silent = true, noremap = true })
---- vim.cmd('command! ReloadConfig lua ReloadConfig()')
--require("plenary.reload").reload_module("ryan") -- replace with your own namespace
