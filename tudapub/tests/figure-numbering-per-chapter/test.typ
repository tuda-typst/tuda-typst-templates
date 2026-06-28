#import "@preview/athena-tu-darmstadt-thesis:0.1.2": *

#show: tudapub.with(
  figure_numbering_per_chapter: true
)

= Chapter 1

#figure("Figure 1.1", caption: "Figure 1.1") <figure-1-1>

#figure("Figure 1.2", caption: "Figure 1.2") <figure-1-2>

See @fig:figure-1-1, @fig:figure-1-2, @fig:figure-2-1, @fig:figure-2-2

#set heading(numbering: "A", supplement: [Appendix])

= Chapter 2

#figure("Figure 2.1", caption: "Figure 2.1") <figure-2-1>

#figure("Figure 2.2", caption: "Figure 2.2") <figure-2-2>

See @fig:figure-1-1, @fig:figure-1-2, @fig:figure-2-1, @fig:figure-2-2