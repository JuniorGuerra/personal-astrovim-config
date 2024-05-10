-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- Lua
require("onedark").setup {
  style = "deep",
}
require("onedark").load()

require("onedark").setup {
  colors = {
    bright_orange = "#ff8800", -- define a new color
    green = "#00ffaa", -- redefine an existing color
  },
  highlights = {
    ["@keyword"] = { fg = "$green" },
    ["@string"] = { fg = "$bright_orange", bg = "#00ff00", fmt = "bold" },
    ["@function"] = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
    ["@function.builtin"] = { fg = "#0059ff" },
  },
}

require("lualine").setup {
  options = {
    theme = "onedark",
    -- ... your lualine config
  },
}
