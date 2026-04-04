// imports

#import "@preview/not-tudabeamer-2023:0.2.1": *

#show: not-tudabeamer-2023-theme.with(
  config-info(
    title: [Title],
    short-title: [Title],
    subtitle: [Subtitle],
    author: "Author",
    short-author: "Author",
    date: datetime.today(),
    department: [Department],
    institute: [Institute],
    logo: text(fallback: true, size: 0.75in, emoji.cat.face),
    //logo: image("logos/tuda_logo.svg", height: 100%)
  ),
  config-store(
    show-logo: true,
    show-bar: true,
    enable-header: true,
  ),
  accentcolor: "9c",
)

#title-slide()

#outline-slide()

= Section

== Subsection

- Some text
- More text
  - This is pretty small, you may want to change it
    - nested
      - bullet
        - points

= Another Section

== Another Subsection

- Some text
- More text
  - This is pretty small, you may want to change it

= Another Section 2

= Another Section 3

= Another Section 4

= Another Section 5

= Another Section 6

= Another Section 7
