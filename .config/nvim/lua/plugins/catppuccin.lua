return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      local cat = require("catppuccin")
      cat.setup({
        flavour = "latte",
        color_overrides = {
          latte = {
            -- colors stolen from https://github.com/erikbackman/mindre-theme
            base = "#F5F5F5",
            crust = "#E8E8E8",
            mantle = "#ECEFF1",
            surface0 = "#ECEFF1",
            surface1 = "#E2E6E9",
            surface2 = "#D3DADE",
            overlay0 = "#CFD8DC",
            overlay1 = "#B0BEC5",
            overlay2 = "#8A9EA8",
            rosewater = "#9e0000",
            flamingo = "#9e0000",
            maroon = "#9e0000",
            yellow = "#d47500",
            peach = "#54433a",
            text = "#000000",
            subtext = "#171a1c",
            lavender = "#5c3e99",
            blue = "#5c3e99",
            sky = "#5c3e99",
            mauve = "#5c3e99",
            sapphire = "#5c3e99",
            green = "#16524f",
            teal = "#16524f",
          },
        },
        custom_highlights = function(colors)
          return {
            Comment = { fg = colors.overlay2 },
          }
        end
      })
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
