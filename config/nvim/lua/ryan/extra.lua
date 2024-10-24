

-- " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
-- local opam_share_dir = system("opam config var share")
-- local opam_share_dir = substitute(opam_share_dir, '[\r\n]*$', '', '')
-- 
-- local opam_configuration = {}
-- 
-- function OpamConfOcpIndent()
--     local opam_share_dir = vim.fn.system("opam config var share"):gsub("\n$", "") -- Get the opam share dir
--     vim.opt.runtimepath:append(opam_share_dir .. "/ocp-indent/vim")
--     -- execute "set rtp^=" .. opam_share_dir .. "/ocp-indent/vim"
-- end
-- 
-- opam_configuration['ocp-indent'] = function(OpamConfOcpIndent)
-- 
-- -- function OpamConfOcpIndex()
-- --   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
-- -- end
-- -- local opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
-- 
-- function OpamConfMerlin()
--   local dir = opam_share_dir .. "/merlin/vim"
--   vim.opt.runtimepath:append(dir)
-- end

-- opam_configuration['merlin'] = function(OpamConfMerlin)
-- 
-- local opam_packages = {"ocp-indent", "ocp-index", "merlin"}
-- local opam_check_cmdline = {"opam list --installed --short --safe --color=never"} .. opam_packages
-- local opam_available_tools = split(system(join(opam_check_cmdline)))
-- for tool in opam_packages
--   -- " Respect package order (merlin should be after ocp-index)
--   if count(s:opam_available_tools, tool) > 0
--     call opam_configuration[tool]()
--   endif
-- endfor
-- " ## end of OPAM user-setup addition for vim / base ## keep this line
-- " ## added by OPAM user-setup for vim / ocp-indent ## 77bbe3f011055b3d1e91001219cbc423 ## you can edit, but keep this line
-- if count(s:opam_available_tools,"ocp-indent") == 0
--   source "/home/ryan/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
-- endif
-- " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
-- 
-- 
-- lua << END
local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
  deepblue = '#080b31',
}

local col = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    --c = { fg = colors.black, bg = colors.deepblue },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = col.sapphire } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.peach } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.grey } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}
--END
