return {
    "nvim-telescope/telescope.nvim",
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
	-- Map 'space space' to open find_files
	vim.keymap.set('n', '<leader><leader>', function()
		require('telescope.builtin').find_files()
	end, { desc = 'Telescope find files' })

        -- Define actions first to keep the table clean
        local actions = require('telescope.actions')

        require('telescope').setup {
            defaults = {
                layout_strategy = 'horizontal',
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-l>'] = actions.select_default,
                    },
                },
                scroll_strategy = 'limit',
            },
            pickers = {
                find_files = {
                    theme = 'ivy',
                    file_ignore_patterns = { 'node_modules', '.git', '.venv' },
                    hidden = true,
                },
                oldfiles = { theme = 'ivy' },
                live_grep = { theme = 'ivy' },
                git_files = { theme = 'ivy' },
                git_commits = { theme = 'ivy' },
                git_branches = { theme = 'ivy' },
                git_status = { theme = 'ivy' },
                git_bcommits = { theme = 'ivy' },
                buffers = { theme = 'ivy' },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
                fzf = {},
            },
        } -- This closes the setup function

        -- You must also load the extensions after setup
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('ui-select')
        require('telescope').load_extension('file_browser')
    end -- This closes the config function,
    
}
