return { 
	{
		'echasnovski/mini.comment', 
		version = '*',
		opts = {
			options = {
				-- Whether to ignore blank lines when commenting
				ignore_blank_line = true,
			},

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Toggle comment (like `gcip` - comment inner paragraph) for both
				-- Normal and Visual modes
				comment = 'gc',

				-- Toggle comment on current line
				-- comment_line = 'gcc',
				comment_line = '<C-_>',

				-- Toggle comment on visual selection
				-- comment_visual = 'gc',
				comment_visual = '<C-_>',

				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				-- Works also in Visual mode if mapping differs from `comment_visual`
				textobject = 'gc',
			},	
		},
	},
}
