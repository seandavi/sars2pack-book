all: html pdf epub

html: index.Rmd
	Rscript -e 'bookdown::render_book("")'

pdf: index.Rmd
	Rscript -e 'bookdown::render_book("", bookdown::pdf_book())'

epub: index.Rmd
    Rscript -e 'bookdown::render_book("", bookdown::epub_book())'
