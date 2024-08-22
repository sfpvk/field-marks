local M = {}
local visual_mark_counter = 1
local initialized = false

function M.setup(config)
	if initialized then
		return
	end
	initialized = true

	vim.api.nvim_set_hl(0, 'MyFieldMark',
			{fg=config.fg or 'black', bg=config.bg or 'orange'})

	vim.api.nvim_call_function('sign_define', {'my_field_mark',
			{numhl='MyFieldMark'}})
end

function M.field_mark_toggle()
	M.setup({})
	local buf_name = vim.api.nvim_buf_get_name(0)
	local ln_signs = vim.api.nvim_call_function('sign_getplaced',
			{vim.api.nvim_get_current_buf(), {lnum='.', group='my_field_mark'}})
	if next(ln_signs[1].signs) == nil then
		vim.api.nvim_call_function('sign_place', {visual_mark_counter,
				'my_field_mark', 'my_field_mark', '', {lnum='.'}})
		visual_mark_counter = visual_mark_counter + 1
	else
		vim.api.nvim_call_function('sign_unplace', {'my_field_mark',
				{id=ln_signs[1].signs[1].id, buffer=buf_name}})
	end
end

function M.field_mark_delall()
	M.setup({})
	local buf_name = vim.api.nvim_buf_get_name(0)
	vim.api.nvim_call_function('sign_unplace',
			{'my_field_mark', {buffer=buf_name}})
end

return M
