icons = require("config.icons")
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/config", [[v:val =~ '\.lua$']])) do
	require("config." .. file:gsub("%.lua$", ""))
end
vim.opt.shiftwidth=2


