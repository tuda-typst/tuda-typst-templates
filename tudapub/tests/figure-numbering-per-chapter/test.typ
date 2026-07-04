
#import "@preview/athena-tu-darmstadt-thesis:0.1.2": *
#import "@preview/hallon:0.1.3"

#show: tudapub.with()
#show: hallon.style-figures.with(heading-levels: 1) // must come after show tudapub

= Chapter 1

#figure("Figure 1.1", caption: "Figure 1.1") <figure-1-1>

#figure("Figure 1.2", caption: "Figure 1.2") <figure-1-2>

See @figure-1-1, @figure-1-2, @figure-2-1, @figure-2-2

#set heading(numbering: "A.1", supplement: [Appendix])
#counter(heading).update(0)

#numbering((n, trimmed: false) => "test " + repr(n), 1)

= Chapter 2

#figure("Figure 2.1", caption: "Figure 2.1") <figure-2-1>

#figure("Figure 2.2", caption: "Figure 2.2") <figure-2-2>

See @figure-1-1, @figure-1-2, @figure-2-1, @figure-2-2