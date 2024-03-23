local colors = {
  blue = "#89b4fa",
  cyan = "#a6e3a1",
  black = "#313244",
  white = "#cdd6f4",
  red = "#f38ba8",
  violet = "#cba6f7",
  grey = "#585b70",
}

local catppuccin_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.typescript" },
  {
    import = "astrocommunity.bars-and-lines.lualine-nvim",
  },
  {
    import = "astrocommunity.editing-support.todo-comments-nvim",
  },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          theme = catppuccin_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
          lualine_b = { "filename", "branch", "diff" },
          lualine_c = {
            "%=", --[[ add your center compoentnts here in place of this comment ]]
          },
          lualine_x = {},
          lualine_y = { "filetype", "progress" },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}
