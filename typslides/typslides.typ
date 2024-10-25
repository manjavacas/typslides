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
) = {

  set page(
    fill: back-color
  )

  set text(size:25pt)
  set par(justify: true)

  [
    *#title*\
    #body
  ]
}