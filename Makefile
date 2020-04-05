all: index.Rmd
	Rscript -e 'bookdown::render_book("")'

