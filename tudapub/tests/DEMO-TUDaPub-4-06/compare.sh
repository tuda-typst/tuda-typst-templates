#!/usr/bin/env bash

#latexmk -interaction=nonstopmode -outdir=build -lualatex
typst compile --font-path ../../../assets/fonts/ test.typ
diffpdf test.pdf build/DEMO-TUDaPub.pdf
