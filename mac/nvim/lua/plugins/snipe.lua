return {
  "leath-dub/snipe.nvim",
  -- keys = {
  --  {"gb", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
  --},
  opts = {},
  config = function() 
    local snip = require("snipe")
    snip.setup({
      ui = {
        max_width = -1, -- -1 means dynamic width
        -- Where to place the ui window
        -- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
        position = "topleft",
      },
      hints = {
        -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
        dictionary = "sadflewcmpghio",
      },
    })

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<S-b>", function()
        local toggle = require("snipe").create_buffer_menu_toggler({
        max_path_width = 1,
      })
      toggle()
      end, { desc = "[P]Snipe" })
  end
}
