-- debug loader

local M = {}

-- Reload a module from scratch, even if it was already loaded before
function M.require(n)
  package.loaded[n] = nil
  local m = require(n)
  return m
end

return M
