#import "typslides.typ": *

#show: typslides.with(
  ratio: "16-9",
  theme: "bluey"
)

#front-slide(
  title: [This is a sample presentation],
  subtitle: [Using typslides],
  authors: [Florence Foo, Nathan Nothing],
  info: [Univeristy of Typstland]
)

#slide(
  title: [This is my _Slide title_]
)[
  #lorem(50)
]

#focus-slide[
  This is an auto-resized _focus slide_.
]