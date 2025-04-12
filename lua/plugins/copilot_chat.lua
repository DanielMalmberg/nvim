-- [[ Copilot Chat ]]
-- Copilot Chat is a chat interface for GitHub Copilot, allowing you to interact with the AI in a conversational manner

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim", -- or zbirenbaum/copilot.lua
      "nvim-lua/plenary.nvim", -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
  },
}
