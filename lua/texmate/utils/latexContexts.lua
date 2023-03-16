local function inMath()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local function inComment()
	return vim.api.nvim_eval('vimtex#syntax#in_comment()') == 1
end

local function inEnv(name)
	local a = vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')")
end

local customEnvs = {
	ex = "exemple",
	df = "definition",
	dm = "demonstration",
	re = "remarque",

	th = "theoreme",
	co = "corollaire",
	le = "lemme",

	pr = "proposition",
	pt = "propriete",
}

local function getCustomEnv(name)
	return customEnvs[name]
end

return {
	ctx = {
		math = inMath,
		comment = inComment,
		env = inEnv,
		envGen = function(name)
			return function() return inEnv(name) end
		end
	},
	getCustomEnv = getCustomEnv
}
