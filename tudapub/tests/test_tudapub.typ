// imports
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/glossarium:0.2.5": gls, glspl, make-glossary, print-glossary
#import "@preview/mitex:0.2.3": *
#import "@preview/drafting:0.1.2": *
#show: make-glossary


#import "@preview/athena-tu-darmstadt-thesis:0.1.2": *


// setup
// #set page(width: 20cm, height:auto)
// #set heading(numbering: "1.")
// #set par(justify: true)


#show: tudapub.with(
  title: [
    TUDaThesis - Title With a second line
  ],
  author: "Albert Author",
  accentcolor: "9c",
  language: "en",

  //abstract: [The abstract...],
  logo_tuda: image("logos/tuda_logo.svg"),

  margin: tud_page_margin_big,

  bib: bibliography("./latex_ref/DEMO-TUDaBibliography.bib", full: true), //, style: "spie")
  page_numbering_starts_after_outline: false,
)


//#rule-grid(width: 10cm, height: 10cm, spacing: 5mm)

// test content
= Über diese Datei

This is some example text that is not very long, but needs to fill some space. @tudapub


This starts a new paragraph. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words. Test words.

== Subheading
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.

Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.

Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.

At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. sanctus sea sed takimata ut vero voluptua. est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur

== Subheading
Some text
=== Subsubheading
Text with some math $x <= 10$
$
  x <= 10
$
More text after eq.

#pagebreak()

== Subheading first on page
Text

== Subheading
Text

=== Subsubheading
Text
==== SubSubsubheading

#pagebreak()
=== Subsubheading first on page

== Subheading
=== Subsubheading
==== SubSubsubheading
Text




= Test Different Elements
Test some footnotes  #footnote[This is a footnote].
Another footnote #footnote[This is another footnote which has a very long text. This footnote expands over multiple lines causing the footnote region to expand vertically.].
//Bla #footnote[Abc \ D \ E \ F \ G \ D]

=== Figures
Here is @fig_test. Here is more text.
#figure(
  image(height: 60pt, "img/opensource_logo.png"),
  placement: none,
  caption: [This is the figure title.],
) <fig_test>
Even more text that may or may not be before the figure.
Some text after the figure. And another sentence containing no meaning.


#pagebreak()


#set heading(outlined: false)
= Not Compare tests
==== Figures with Tables
Here is @fig_test_table. Here is more text.
#figure(
  table(
    columns: 2,
    [A], [B],
    [1], [2],
  ),
  caption: [This is the figure title.],
) <fig_test_table>
Even more text that may or may not be before the figure.
Some text after the figure. And another sentence containing no meaning.
#figure(
  table(
    columns: 2,
    [AA], [BB],
    [1], [2],
  ),
  caption: [This is the figure title.],
)



== Test hyphenate ...
#pagebreak()
#set text(hyphenate: false)
#set text(alternates: true)
Test Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus

New paragraph...
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus

== Subheading
Test Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque
doleamus animo, cum corpore dolemus, fieri tamen permagna accessio potest, si aliquod
aeternum et infinitum impendere malum nobis opinemur. Quod idem licet transferre in
voluptatem, ut postea.


#set text(hyphenate: true)
#lorem(135)
