#import "utils.typ": *

#let theme-color= state("theme-color", none)

#let typslides(
  ratio: "16-9",
  theme: "bluey",
  body
) = {

  theme-color.update(theme-colors.at(theme))

  set text(font: "Fira Sans")

  set page(
    paper: "presentation-" + ratio
  )

  body
}


//************************************** Useful functions *************************************\\

#let get-color = context {
  theme-color.get()
}

#let stress(body) = context {
  text(fill: theme-color.get(), weight: "semibold")[
    #body
  ] 
}

#let framed(title: none, back-color : rgb("fbf7ee"), content) = context {

  set block(
    width: 100%,
    inset: (x: .45cm, top: .45cm, bottom: .5cm),
    breakable: false,
    above: .1cm,
    below: .1cm
  )
  
  if title != none {
    stack(
      block(
        fill: theme-color.get(),
        radius: (top: .2cm, bottom: 0cm),
        stroke: 2pt)[
          #text(weight: "semibold", fill: white)[#title]
        ],
      block(
        radius: (top: 0cm, bottom: .2cm),
        stroke: 2pt,
        content
      )
    )
  } else {
    stack(
      block(
        fill: back-color,
        radius: (top: .2cm, bottom: .2cm),
        stroke: 2pt,
        content
      ) 
    )
  }
}

//**************************************** Front Slide ****************************************\\

#let front-slide(
  title: none,
  subtitle: none,
  authors: none,
  info: none,
) = context {

  make-frontpage(
    title,
    subtitle,
    authors,
    info,
    theme-color.get()
  )
  
}

//*************************************** Content Slide ***************************************\\


//**************************************** Title Slide ****************************************\\

#let title-slide(
  body
) = context {
  
  set align(left + horizon)
  set text(size: 40pt, weight: "semibold")

  smallcaps(body)
  v(-.75cm)
  divider(color: theme-color.get())
}

//**************************************** Focus Slide ****************************************\\

#let focus-slide(
  text-color: white,
  text-size: 60pt,
  body
) = context {

  set page(
    fill: theme-color.get(),
    footer: none
  )
  
  set text(
    weight: "semibold",
    size: text-size,
    fill: text-color,
    font: "Fira Sans"
  )

  set align(center + horizon)

  resize-text(body)
}

//****************************************** Slide ********************************************\\

#let slide(
  title: [],
  back-color: white,
  body
) = context {

  set page(
    fill: back-color,
    footer: [
      #align(right)[
        #let p = context counter(page).display(
          "1/1",
          both: true,
        )
        #text(weight: "regular", size: 12pt)[#p]
      ]
    ]
  )

  set list(
    marker: text(theme-color.get(), [•])
  )

  set text(size:25pt)
  set par(justify: true)

  [
    *#title*\
    #body
  ]
}