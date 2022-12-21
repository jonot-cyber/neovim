-- Theme list
local theme_list = {
    "catppuccin",
    "catppuccin-latte",
    "catppuccin-frappe",
    "catppuccin-macchiato",
    "catppuccin-mocha",
    "kanagawa",
    "nightfox",
    "dayfox",
    "dawnfox",
    "duskfox",
    "nordfox",
    "terafox",
    "carbonfox",
    "github_dark",
    "github_dark_colorblind",
    "github_dark_default",
    "github_light",
    "github_light_colorblind",
    "github_light_default",
    "github_dimmed",
    "gruvbox",
    "material",
    "nord",
    "onedarkpro",
    "melange",
    "vscode",
    "tokyodark",
    "zephy-nvim",
    "monokai",
    "monokai_pro",
    "monokai_ristretto",
    "monokai_soda",
    "aurora",
    "doom-one",
    "solarized",
    "neon"
    
}
-- Applies a random theme
function random_theme()
    local theme_index = math.random(#theme_list)
    vim.cmd("colorscheme " .. theme_list[theme_index])
end

vim.api.nvim_create_user_command("RandomTheme", random_theme, {})
