require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 3,
			},
		},
	},
})
