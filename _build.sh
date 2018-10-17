#!/bin/sh

set -ev

Rscript -e 'bookdown::render_book("index.rmd")'