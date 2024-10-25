#let theme-colors = (
  bluey : rgb("3059AB"),
  reddy : rgb("BF3D3D"),
  greeny : rgb("28842F"),
  yelly : rgb("C4853D"),
  purply : rgb("862A70")
)

//************************************************************************\\

#let resize-text(body) = layout(size => {
  let font-size = text.size
  let (height,) = measure(
    block(width: size.width, text(size: font-size)[#body]),
  )
  
  let max_height = size.height;
  
  while height > max_height {
      font-size -= 0.2pt
      height = measure(
        block(width: size.width, text(size: font-size)[#body]),
      ).height
  }
  
  block(
      height: height,
      width: 100%,
      text(size: font-size)[#body]
  )
})

//************************************************************************\\

#let divider(color: none) = {
  line(
    length: 100%,
    stroke: 2.5pt + color
  )
}

//************************************************************************\\

#let make-frontpage(
  title, 
  subtitle,
  authors,
  info,
  theme-color
) = {

  set align(left + horizon)
  set page(footer: none)

  text(40pt, weight: "bold")[#smallcaps(title)]

  v(-.95cm)

  if subtitle != none {
    set text(24pt)
    v(.1cm)
    subtitle
  }

  let subtext = []

  if authors != none {
    subtext += text(22pt, weight: "regular")[#authors]
  }

  if info != none {
    subtext += text(20pt, fill:theme-color, weight: "regular")[#v(-.15cm) #info]
  }
  
  divider(color: theme-color)
  [#subtext]
}