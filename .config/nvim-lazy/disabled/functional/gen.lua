return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo", -- The default model to use.
    host = "api.together.xyz",
    port = "443",
    command = function(options)
      local body = { model = options.model, stream = true }

      local token = os.getenv("OPENAI_API_KEY")
      return "curl --silent --no-buffer -X POST https://"
        .. options.host
        .. ":"
        .. options.port
        .. "/v1/chat/completions -d $body"
        .. " -H 'Content-Type: application/json'"
        .. " -H 'Authorization: Bearer "
        .. token
        .. "'" -- OpenAI API Key
    end,
  },
}
