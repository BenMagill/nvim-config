return {
  { "nvim-treesitter/nvim-treesitter-context" },
  { "preservim/nerdcommenter" },

  -- Make sure to add langs here for context to work!!!
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "rust",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  { "prichrd/netrw.nvim" },
  { "theprimeagen/harpoon" },
}
