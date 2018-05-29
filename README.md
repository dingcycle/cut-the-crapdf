# cut-the-crapdf 

Only print what's necessary from your train tickets.

# In a nutshell


```
        +------------+    +------------+    +------------+    +------------+
        |            |    |            |    |            |    |            |
        |  USEFUL    |    |  USEFUL    |    |  USEFUL    |    |  USEFUL    |
        |  part      |    |  part      |    |  part      |    |  part      |
4x A4   |            |    |            |    |            |    |            |
        |            |    |            |    |            |    |            |
        |            |    |            |    |            |    |            |
        |            |    |            |    |            |    |            |
        |  _useless_ |    |  _useless_ |    |  _useless_ |    |  _useless_ |
        |  part      |    |  part      |    |  part      |    |  part      |
        |            |    |            |    |            |    |            |
        +---------+--+    +----------+-+    +--+---------+    +--+---------+
                  |                  |         |                 |
                  |                  |         |                 |
                  |                  |         |                 |
                  |                  |         |                 |
                  +--------------+   |         |   +-------------v
                                 |   |         |   |
                                 |   |         |   |
                          +------v---v-+    +--v---v-----+
                          |            |    |            |
                          |  USEFUL    |    |  USEFUL    |
                          |  part      |    |  part      |
                          |            |    |            |
                 2x A4    |            |    |            |
                          |            |    |            |
                          |            |    |            |
                          |  USEFUL    |    |  USEFUL    |
                          |  part      |    |  part      |
                          |            |    |            |
                          +------------+    +------------+

```


# Context

If you don't have a smartphone and still print your e-tickets for a train
company like the french SNCF, you might want to only print what's necessary
for the control team and yourself: your **schedule** and the 
**[QR Code](https://en.wikipedia.org/wiki/QR_code)**.

Here's a way to only keep the top part of each A4 page (the smart ones will
realize this gives multiple baby A5 pages), and assemble them in A4 pages again.

In a general case, you've split the number of A4 pages by two and have thus killed
half less kittens (your mileage may vary).

# Usage


```
./cut_the_crapdf.sh original_ticket.pdf 
          [...]
  pdfjam: Finished.  Output was to 'original_ticket_condensed.pdf'.
```

It created one intermediary file (suffixed `_cropped`) 
and the `condensed`-suffixed file is the one that interests us. Voilà!

```
$ ls original_ticket*
original_ticket_condensed.pdf  original_ticket_cropped.pdf  original_ticket.pdf
```

Check with pdfinfo.

Before:
```
$ pdfinfo original_ticket.pdf | grep -E 'Pages|Page size'
Pages:          8
Page size:      595 x 842 pts (A4)

```

After
```
$ pdfinfo original_ticket_condensed.pdf | grep -E 'Pages|Page size'
Pages:          4
Page size:      595.276 x 841.89 pts (A4)
```

# Requirements

- [pdfjam](https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam/#download), 
  probably available for your favourite distro.
