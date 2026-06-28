#import "@preview/athena-tu-darmstadt-thesis:0.1.2": *
#import "@preview/equate:0.3.3": equate

#show: tudapub.with(
  //equation_numbering_per_chapter: true // uncommenting will OOM
)
#show: equate.with(sub-numbering: true)
#set math.equation(numbering: "(1.1)")

= Chapter 1

$ 1 + 1 #<figure-1-1> \
1 + 2 #<figure-1-2> $ <figure-1>

See @figure-1, @figure-1-1, @figure-1-2, @figure-2, @figure-2-1, @figure-2-2

#set heading(numbering: "A", supplement: [Appendix])

= Chapter 2

$ 2 + 1 #<figure-2-1> \
2 + 2 #<figure-2-2> $ <figure-2>

See @figure-1, @figure-1-1, @figure-1-2, @figure-2, @figure-2-1, @figure-2-2
