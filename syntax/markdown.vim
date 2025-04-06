syntax region markdownCustomBlock start="```custom" end="```" keepend contains=markdownCustomBlockContent
syntax match markdownCustomBlockContent contained /[^`]\+\(`[^`]\+\)*[^`]\+/
highlight markdownCustomBlockContent ctermbg=darkgray guibg=#661111

augroup MarkdownCustomHighlight
  autocmd!
  autocmd FileType markdown syntax enable
augroup END
