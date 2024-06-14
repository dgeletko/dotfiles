return {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_auto_header = 1
    vim.g.vimwiki_hl_headers = 1
    vim.g.vimwiki_list = {
      {
        path = '~/Documents/vimwiki',
        path_html = '~/Documents/vimwiki/html',
        syntax = 'markdown',
        ext = '.md',
        links_space_char = '_'
      },
  }
  end
}

