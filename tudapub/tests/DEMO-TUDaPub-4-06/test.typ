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
)