local defaults = require("texmate.config")
local snippets = require("texmate.snippets")
local concat = require("texmate.utils.concat")

local ok, luasnip = pcall(require, "luasnip")

local M = {}

M.setup = function(opts)
	if not ok then
		print("oula pas luasnip")
		return
	end
	--Override defaults
	opts = vim.tbl_extend("keep", opts, defaults)

	if (opts.cleanOnExit) then
		vim.api.nvim_create_autocmd("VimLeavePre", {
			pattern = "*.tex",
			command = "VimtexClean"
		})
	end

	if (opts.loadSnippets) then
		local toLoad = {}
		for _, v in pairs(snippets) do
			toLoad = concat(toLoad, v)
		end
		luasnip.add_snippets(nil, { tex = toLoad })
	end
end


return M
