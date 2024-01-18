return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
            },
          },
        },
      },
    },
    setup = {
      ["lua_ls"] = function()
        vim.print("configuring")
      end,
    },
  },
}

--
--
--
-- init = function()
--   -- local cf = vim.fn.expand("%%:h")
--   local curdir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
--   local lua_modules_paths = vim.fs.find("lua_modules", { upward = true, stop = vim.uv.os_homedir(), path = curdir })
--   local lua_paths = {
--     -- vim.fn.expand("~/.luarocks/share/lua/5.3"),
--     -- "/usr/share/lua/5.3",
--   }
--   for _, p in pairs(lua_modules_paths) do
--     table.insert(lua_paths, p .. "/lib/luarocks/rocks-5.4")
--   end
--
--   -- print("luamodule", vim.inspect(lua_paths))
--
--   require("lspconfig").lua_ls.setup({
--     settings = {
--       Lua = {
--         runtime = {
--           version = "Lua 5.3",
--           path = {
--             "?.lua",
--             "?/init.lua",
--             -- vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
--             -- vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
--             -- "/usr/share/5.3/?.lua",
--             -- "/usr/share/lua/5.3/?/init.lua",
--           },
--         },
--         workspace = {
--           library = lua_paths,
--         },
--       },
--     },
--   })
-- end,
