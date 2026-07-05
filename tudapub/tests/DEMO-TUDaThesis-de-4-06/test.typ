// https://github.com/tudace/tuda_latex_templates/blob/4.06/examples/DEMO-TUDaThesis.tex

#import "@preview/athena-tu-darmstadt-thesis:0.1.2": *
#import "@preview/metalogo:1.2.0": LaTeX

#show: tudapub.with(
  language: "de",
  title: [TUDaThesis -- Abschlussarbeiten im Corporate Design der TU Darmstadt],
  subtitle: [#LaTeX using TU Darmstadt's CI],
  thesis_type: "bachelor",
  author: "Marei Peischl",
  date_of_submission: datetime.today(),
  reviewer_names: ("Gutachter*in 1", "Gutachter*in 2", [...]),
  location: "Darmstadt",
  logo_sub_content_text: [
    Studienbereich\
    Computational Engineering\
    \
    Institut
    \
    Arbeitsgruppe
  ],
  logo_tuda: image("logos/tuda_logo.svg"),
  show_pages: (
    title_page: true,
    outline_table_of_contents: true,
    thesis_statement_pursuant: false,
  ),
  bib: bibliography("DEMO-TUDaBibliography.bib"),
)

#set heading(numbering: none)

== About this file

"DEMO-TUDaThesis.tex" is a basic template for theses using the Corporate Design of TU Darmstadt.
It is part of TUDa-CI, which is the official template bundle of TU Darmstadt. The original version was inspired by the "tuddesign" bundle by C.~v.~Loewenich and J.~Werner.
For more information on class options and usage have a look at the documentation @tuda-ci.