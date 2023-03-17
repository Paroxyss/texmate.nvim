local defaults = require("texmate.config")
local snippets = require("texmate.snippets")
local concat = require("texmate.utils.concat")

local M = {}

M.setup = function(opts)
	--Override defaults
	vim.tbl_extend("keep", opts, defaults)

	if (opts.cleanOnExit) then
		vim.api.nvim_create_autocmd("VimLeavePre", {
			pattern = "*.tex",
			command = "VimtexClean"
		})
	end

	if (opts.loadSnippets) then
		local toLoad = {}
		for _, v in ipairs(snippets) do
			toLoad = concat(toLoad, v)
		end
		require("luasnip").add_snippets("snippets", {
			tex = toLoad
		})
	end
end


return M
