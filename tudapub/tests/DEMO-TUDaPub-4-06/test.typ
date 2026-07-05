// https://github.com/tudace/tuda_latex_templates/blob/4.06/examples/DEMO-TUDaPub.tex

#import "@preview/athena-tu-darmstadt-thesis:0.1.2": *
#import "@preview/metalogo:1.2.0": LaTeX

#show: tudapub.with(
  title: [TUDaPub -- #LaTeX\-Paper using TU Darmstadt's Corporate Design],
  subtitle: [The document class tudapub],
  author: "Marei Peischl* and der TEX-Löwe",
  //thesis_type: none,
  date_of_submission: datetime.today(),
  reviewer_names: (),
  location: none,
  logo_sub_content_text: "Text, e.g. Institute",
  logo_tuda: image("logos/tuda_logo.svg"),
  show_pages: (
    title_page: true,
    outline_table_of_contents: false,
    thesis_statement_pursuant: false,
  ),
  bib: bibliography("DEMO-TUDaBibliography.bib"),
)

#set heading(numbering: none)

== Abstract

Abstract using the document main language (here English)

== Zusammenfassung

Weitere Zusammenfassung in einer anderen Sprache (hier Deutsch), sofern benötigt.

== Contents

//#tudapub-make-outline-table-of-contents()

#set heading(numbering: "1.1")

== About this file

"DEMO-TUDaPub.tex" is an example file for the document class "tudapub.cls".
It is part of TUDa-CI, which is the official template bundle of TU Darmstadt. The original version was inspired by the "tuddesign" bundle by C.~v.~Loewenich and J.~Werner.
For more information on class options and usage have a look at the documentation @tuda-ci.
