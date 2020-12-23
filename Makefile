all: html pdf

html: index.Rmd
	Rscript -e 'bookdown::render_book("")'

pdf: index.Rmd
	Rscript -e 'bookdown::render_book("", bookdown::pdf_book())'
