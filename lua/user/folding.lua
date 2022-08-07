local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

local config = {
  keep_indentation = true,
  fill_char = '.',
  sections = {
    left = {
      'content',
    },
    right = {
      ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
      function(config) return config.fill_char:rep(3) end
    }
  },
  remove_fold_markers = true,
  process_comment_signs = 'spaces',
  stop_words = {
    '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
  },
  add_close_pattern = true, -- true, 'last_line' or false

  matchup_patterns = {
    {  '{', '}' },
    { '%(', ')' }, -- % to escape lua pattern char
    { '%[', ']' }, -- % to escape lua pattern char
  },

  ft_ignore = { 'neorg' },
}

require("pretty-fold").setup{
  config
}
