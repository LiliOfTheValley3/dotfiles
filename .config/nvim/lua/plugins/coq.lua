return {
  -- COQ
  {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim", branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.coq_settings = {
	auto_start = true, -- if you want to start COQ at startup
	-- Your COQ settings here
      }
    end,
    config = function()
      -- Your LSP settings here
    end,
  },

  -- LSP
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,

      handlers = {
	["lua_ls"] = function ()
	  local lspconfig = require("lspconfig")
	  lspconfig.lua_ls.setup({
	    settings = {
	      Lua = {
		diagnostics = {
		  globals = { "vim" }
		}
	      }
	    }
	  })
	end
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  }
}
