#!/usr/bin/perl

@default_files = ('main.tex');

$pdf_mode = 3;
$latex = 'uplatex -synctex=1 %O %S';
$bibtex = 'upbibtex %O %B';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars --output-safecharsset=full';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex %O -o %D %S';
