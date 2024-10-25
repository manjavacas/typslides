#import "typslides.typ": *

#show: typslides.with(
  ratio: "16-9",
  theme: "bluey"
)

#front-slide()[
  
]

#slide(title:[This is my _Slide title_])[
  #lorem(100)
]

#focus-slide()[
  This is an auto-resized _focus slide_.
]