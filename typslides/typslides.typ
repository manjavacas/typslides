#import "utils.typ": *

#let color-1 = state("color-1", black)
#let color-2= state("color-2", none)

#let typslides(
  ratio: "16-9",
  theme: "bluey",
  body
) = {

  color-2.update(theme-colors.at(theme))

  set text(font: "Fira Sans")

  set page(
    paper: "presentation-" + ratio
  )

  body
}


//**************************************** Front Slide ****************************************\\

#let front-slide(
  body
) = {
  body
}

//*************************************** Content Slide ***************************************\\


//**************************************** Title Slide ****************************************\\


//**************************************** Focus Slide ****************************************\\

#let focus-slide(
  text-color: white,
  text-size: 60pt,
  body
) = context {

  set page(
    fill: color-2.get(),
    footer: none
  )
  
  set text(
    weight: "semibold",
    size: text-size,
    fill: text-color,
    font: "Fira Sans"
  )

  set align(center+horizon)

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