#import "./typslides.typ": *

#show: typslides.with(
  ratio: "16-9",
  theme: "bluey",
)

#front-slide(
  title: "This is a sample presentation",
  subtitle: [Using _typslides_],
  authors: "Antonio Manjavacas",
  info: [#link("https://github.com/manjavacas/typslides")],
)

#table-of-contents()

#title-slide[
  This is a _Title slide_
]

#slide()[
  - This is a simple `slide` with no title.
  - #stress("Bold and coloured") text by using `#stress(text)`.
  - Sample link: #link("typst.app")
  - Sample references: @typst, @typslides.

  #framed[This text has been written using `#framed(text)`. The background color of the box is customisable.]

  #framed(title: "Frame with title")[This text has been written using `#framed(title:"Frame with title")[text]`.]
]

#focus-slide[
  This is an auto-resized _focus slide_.
]

#slide(title: "This is the slide title")[
  #grayed([This is a `grayed` text.])\
  #grayed($P_t = alpha - 1 / (sqrt(x) + f(y))$)\
  #lorem(80)
]

#bibliography-slide("bibliography.bib")