-- return busted

return {
  "klen/nvim-test",
  config = function()
    local Runner = require("nvim-test.runner")

    local busted = Runner:init({
      command = "lua_modules/bin/busted",
      file_pattern = "\\v_spec\\.(lua|moon)$",
      find_files = "{name}_spec.{ext}",
    }, {
      lua = [[
    ((function_call (identifier) (arguments (string) @test-name (function_definition))) @scope-root)
    ]],
    })

    function busted:parse_testname(name)
      return name:gsub("^[\"']", ""):gsub("[\"']$", "")
    end

    function busted:build_test_args(args, tests)
      table.insert(args, "--filter")
      table.insert(args, table.concat(tests, " "))
    end

    require("nvim-test").setup({
      run = true, -- run tests (using for debug)
      commands_create = true, -- create commands (TestFile, TestLast, ...)
      filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
      silent = false, -- less notifications
      term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
      termOpts = {
        direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
        width = 96, -- terminal's width (for vertical|float)
        height = 24, -- terminal's height (for horizontal|float)
        go_back = false, -- return focus to original window after executing
        stopinsert = "auto", -- exit from insert mode (true|false|"auto")
        keep_one = true, -- keep only one terminal for testing
      },
      runners = { -- setup tests runners
        cs = "nvim-test.runners.dotnet",
        go = "nvim-test.runners.go-test",
        haskell = "nvim-test.runners.hspec",
        javascriptreact = "nvim-test.runners.jest",
        javascript = "nvim-test.runners.jest",
        -- lua = "nvim-test.runners.busted",
        lua = busted,
        python = "nvim-test.runners.pytest",
        ruby = "nvim-test.runners.rspec",
        rust = "nvim-test.runners.cargo-test",
        typescript = "nvim-test.runners.jest",
        typescriptreact = "nvim-test.runners.jest",
      },
    })
  end,
}
