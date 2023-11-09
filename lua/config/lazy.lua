local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
        },
      },
    },

    --{
    --"zbirenbaum/copilot.lua",
    --cmd = "Copilot",
    --build = ":Copilot auth",
    --opts = {
    --suggestion = { enabled = true, auto_trigger = true, accept = "<C-k>" },
    --panel = { enabled = false, auto_refresh = true },
    --filetypes = {
    --markdown = true,
    --help = true,
    --},
    --},
    --},
    --{
    --"zbirenbaum/copilot-cmp",
    --dependencies = "copilot.lua",
    --opts = {},
    --config = function(_, opts)
    --local copilot_cmp = require("copilot_cmp")
    --copilot_cmp.setup(opts)
    ---- attach cmp source whenever copilot attaches
    ---- fixes lazy-loading issues with the copilot cmp source
    --require("lazyvim.util").lsp.on_attach(function(client)
    --if client.name == "copilot" then
    --copilot_cmp._on_insert_enter({})
    --end
    --end)
    --end,
    --},
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("netrw").setup({
  -- Put your configuration here, or leave the object empty to take the default
  -- configuration.
  icons = {
    symlink = "", -- Symlink icon (directory and file)
    directory = "", -- Directory icon
    file = "", -- File icon
  },
  use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
  mappings = {}, -- Custom key mappings
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
