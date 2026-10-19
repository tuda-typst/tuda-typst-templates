#let natural-image(..args) = context {
  let (width, height) = measure(image(..args))
  image(..args, width: width, height: height)
}

#let check-font-exists(font-name) = {
  let measured = measure[
    #text(font: font-name, fallback: false)[
      Test Text
    ]
  ]
  if measured.width == 0pt [
    #rect(stroke: (paint: red), radius: 1mm, inset: 1.5em, width: 100%)[
      #set text(fallback: true)
      #set heading(numbering: none)
      #show link: it => underline(text(blue)[#it])
      === Error - Can Not Find Font "#font-name"
      Please install the required font "#font-name". For instructions see the #link("https://github.com/tuda-typst/tuda-typst-templates#logo-and-font-setup")[Readme of this package].
    ]
    //#pagebreak()
  ]
}
