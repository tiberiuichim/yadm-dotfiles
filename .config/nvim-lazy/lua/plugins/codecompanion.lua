return {
  "olimorris/codecompanion.nvim",
  -- event = "VeryLazy", -- Uncomment if you want to lazy load the plugin
  dependencies = {
    -- "github/copilot.vim", -- Uncomment if needed
    "ravitemer/mcphub.nvim",
  },
  opts = {
    log_level = "DEBUG", -- Moved here, was incorrectly nested
    strategies = {
      -- NOTE: Changed adapters to use the custom 'gemini_cli'
      -- chat = { adapter = "gemini_cli" },
      -- inline = { adapter = "gemini_cli" },
      -- Consider adding other strategies if you use them, e.g.,
      -- cmd = { adapter = "gemini_cli" },
    },
    adapters = {
      -- Custom 'gemini_cli' adapter defined directly under 'adapters'
      gemini_cli = function()
        return require("codecompanion.adapters").extend("gemini_cli", {
          commands = {
            default = {
              "/home/tibi/.local/share/nvm/v22.20.0/bin/node",
              "/home/tibi/.local/share/nvm/v22.20.0/bin/gemini",
              "--experimental-acp",
            },
          },
          defaults = {
            auth_method = "gemini-api-key",
            mcpServers = {},
            timeout = 20000, -- 20 seconds
          },
          -- Removed 'env' key, as the base adapter handles GEMINI_API_KEY from vim.env
          -- If you need to set it explicitly from an environment variable:
          env = {
            GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
          },
        })
      end,
    },
    -- mcphub extension configuration moved directly into opts
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          -- MCP Tools
          make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true, -- Show tool results directly in chat buffer
          format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          make_vars = true, -- Convert MCP resources to #variables for prompts
          -- MCP Prompts
          make_slash_commands = true, -- Add MCP prompts as /slash commands
        },
      },
    },
  },
  -- A 'config' function is generally not needed if all options can be defined in 'opts'.
  -- Lazy.nvim will automatically call require("codecompanion").setup(opts) for you.
  -- If you uncommented a 'config' function, it would look like this:
  -- config = function(_, opts)
  --   require("codecompanion").setup(opts)
  -- end,
}

-- return {
--   "olimorris/codecompanion.nvim",
--   -- event = "VeryLazy",
--   dependencies = {
--     -- "github/copilot.vim",
--     "ravitemer/mcphub.nvim",
--   },
--   --
--   opts = {
--     --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
--     strategies = {
--       --NOTE: Change the adapter as required
--       chat = { adapter = "gemini" },
--       inline = { adapter = "gemini" },
--     },
--     adapters = {
--       acp = {
--         gemini_cli = function()
--           return require("codecompanion.adapters").extend("gemini_cli", {
--             commands = {
--               default = {
--                 "node",
--                 "/home/tibi/.local/share/nvm/v22.20.0/bin/gemini",
--                 "--experimental-acp",
--               },
--             },
--             defaults = {
--               auth_method = "gemini-api-key",
--               mcpServers = {},
--               timeout = 20000, -- 20 seconds
--             },
--             env = {
--               GEMINI_API_KEY = "GEMINI_API_KEY",
--             },
--           })
--         end,
--       },
--     },
--     opts = {
--       log_level = "DEBUG",
--     },
--   },
--
--   -- opts = {
--   --   opts = {
--   --     log_level = "DEBUG", -- or "TRACE"
--   --   },
--   --   strategies = {
--   --     chat = { adapter = "gemini_cli" },
--   --     inline = { adapter = "gemini" },
--   --     cmd = { adapter = "gemini" },
--   --   },
--   -- },
--
--   -- config = function()
--   --   vim.api.nvim_echo({ { "Hello, this is a startup message!" } }, true, {})
--   --
--   --   require("codecompanion").setup({
--   --     -- opts = {
--   --     --   log_level = "DEBUG", -- or "TRACE"
--   --     -- },
--   --
--   --     -- strategies = {
--   --     --   chat = { adapter = "gemini_cli" },
--   --     --   inline = { adapter = "gemini" },
--   --     --   cmd = { adapter = "gemini" },
--   --     -- },
--   --
--   --     extensions = {
--   --       mcphub = {
--   --         callback = "mcphub.extensions.codecompanion",
--   --         opts = {
--   --           make_vars = true,
--   --           make_slash_commands = true,
--   --           show_result_in_chat = true,
--   --         },
--   --       },
--   --     },
--   --   })
--   -- end,
-- }
