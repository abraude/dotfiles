local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    "rmehri01/onenord.nvim",
    requires = { "tjdevries/colorbuddy.nvim" }
  }

  use "nvim-lua/plenary.nvim" -- Common utilities
  use "kyazdani42/nvim-web-devicons" -- File icons
  use "goolord/alpha-nvim" -- Startup page

  use "L3MON4D3/LuaSnip"

  use "nvim-lualine/lualine.nvim" -- Statusline
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/nvim-cmp" -- Completion
  use "neovim/nvim-lspconfig" -- LSP
  use "glepnir/lspsaga.nvim" -- LSP UIs
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }

  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope-project.nvim"

  --   use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use "akinsho/nvim-bufferline.lua"

  use "norcalli/nvim-colorizer.lua"

  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim" -- For git blame & browse

  use "lukas-reineke/indent-blankline.nvim" -- IndentLine event = "BufReadPre",
  use "p00f/nvim-ts-rainbow"
  use "numToStr/Comment.nvim"
  use "phaazon/hop.nvim"
  use "ggandor/leap.nvim"

  use "nathom/filetype.nvim"

  use {
    "github/copilot.vim",
    branch = "release",
    config = function()
      local sysname = vim.loop.os_uname().sysname
      if sysname == "Darwin" then
        vim.g.copilot_node_command = "/opt/homebrew/Cellar/node@16/16.18.0/bin/node"
      end
    end
  }

end)
