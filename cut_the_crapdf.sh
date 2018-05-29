#!/bin/bash

pdfinput=${1:-ticket.pdf}

if ! [ -f "$pdfinput" ]
then
    echo "KO: file $pdfinput does not seem to exist"
    exit 1
fi

# ticket.pdf -> ticket
pdfinputbase=$( basename $pdfinput .pdf )

# keep upper part of all A4 pages and output these cropped pages
# into A5 pages (packaged a single file)
pdfjam --keepinfo --trim "0mm 148.5mm 0mm 0mm" --clip true --landscape -o ${pdfinputbase}_cropped.pdf $pdfinput

pdfnup --nup 1x2 --outfile ${pdfinputbase}_condensed.pdf ${pdfinputbase}_cropped.pdf --a4paper --no-landscape
