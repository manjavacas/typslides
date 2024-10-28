#import "typslides.typ": *

#show: typslides.with(
  ratio: "16-9",
  theme: "bluey"
)

#front-slide(
  title: "This is a sample presentation",
  subtitle: "Using typslides",
  authors: "Florence Foo, Nathan Nothing",
  info: "Univeristy of Typstland"
)

#table-of-contents()

#title-slide[
  This is a title slide
]

#slide()[
  - This slide has no title.
  - #stress("Bold and coloured") text by using `#stress(text)`. 
  - Theme color: #get-color, obtained with `#get-color`.
  - These are some sample references: @typst, @typslides.
  
  #framed[This text has been written using `#framed(text)`. The background color of the box is customisable.]
  
  #framed(title:"Frame with title")[This text has been written using `#framed(title:"Frame with title")[text]`.]
]

#focus-slide[
  This is an auto-resized _focus slide_.
]

#title-slide[
  Another title slide
]

#slide(title: "This is the slide title")[
  #lorem(165)
]

#bibliography-slide("bibliography.bib")