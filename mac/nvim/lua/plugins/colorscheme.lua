return {
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- vim.cmd("colorscheme tokyodark")
    end,
  },
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd("colorscheme onenord")
    end,
  },
}
