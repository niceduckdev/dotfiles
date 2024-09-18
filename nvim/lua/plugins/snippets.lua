return {
    'L3MON4D3/LuaSnip',
	build = function()
		local ls = require "luasnip"
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		ls.add_snippets("lua", {
			s("img", {
				t('image hier!!!')		
			})
		})
	end,
}
