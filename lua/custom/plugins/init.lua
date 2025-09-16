-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_latexmk = {
        options = { '-pdf', '-pdflatex="xelatex --shell-escape %O %S"', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode' },
      }
    end,
  },
  {
    'aznhe21/actions-preview.nvim',
    config = function()
      vim.keymap.set({ 'v', 'n' }, '<leader>fa', require('actions-preview').code_actions)
    end,
    opts = {
      telescope = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = 'top',
          preview_cufoff = 20,
          preview_height = function(_, _, maxlines)
            return max_lines - 15
          end,
        },
      },
    },
  },
}
