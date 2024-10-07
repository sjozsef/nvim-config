local M = {}

-- Function to toggle oil.nvim file browser
function M.toggle_oil()
  local oil = require('oil')
  if oil.is_open() then
    oil.close()
  else
    oil.open()
  end
end

return M
