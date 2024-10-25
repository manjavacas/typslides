
#let color-1 = black
#let color-2 = rgb("3059AB")
// #let color-2 = rgb("BF3D3D")
// #let color-2 = rgb("28842F")
// #let color-2 = rgb("C4853D")
// #let color-2 = rgb("862A70")

#let _divider = (color: color-2) => {
  context {
    let w = 86.75% * page.width
    rect(
      width: w,
      height: .05in,
      fill: color
    )
  }
}

#let _frontpage(
  title, 
  subtitle,
  authors,
  info
) = {

  set align(left + horizon)
  set page(footer: none)

  text(40pt, fill:color-1, weight: "bold")[#title]

  v(-.95cm)

  if subtitle != none {
    text(20pt, fill:color-1, style: "italic")[#subtitle] 
  }

  let subtext = []

  if authors != none {
    subtext += text(20pt, fill:color-1, weight: "regular")[#authors]
  }

  if info != none {
    subtext += text(20pt, fill:color-2, weight: "regular")[\ #info]
  }
  
  _divider()
  [#subtext]
}

#let _index() = {
  set page(footer: none)
  show heading: it => {
      set align(left + horizon)
      if it.level != none {
        if it.level == 1 {
          text(weight: "semibold")[#it]
          v(-.5cm)
          _divider()
        }
      }
  }
  outline()
  pagebreak()
}

#let presentation(
  title: [Sample title],
  subtitle: none,
  authors: none,
  info: none,
  content
) = {

  //***************************** GLOBAL SET RULES ****************************//
  
  set page(
    paper: "presentation-16-9",
    footer: context [
      #align(right)[
        #let p = context counter(page).display(
          "1/1",
          both: true,
        )
        #text(weight: "regular", size: 12pt, fill:color-2)[#p]
      ]
    ]
  )

  set text(
    size: 18pt,
    hyphenate: true,
    font: "Fira Sans"
  )

  set par(
    justify: true
  )

  set heading(
    numbering: "1.",
    outlined: true
  )

  set list(
    marker: text(color-2, [•])
  )

  //******************************** FRONT PAGE *******************************//

  _frontpage(
    title,
    subtitle,
    authors,
    info
  )

  pagebreak()

  //************************************ INDEX ********************************//

  set outline(
    fill: line(length: 100%),
    indent: 1em
  )

  show outline.entry.where(level: 1): it => {
    v(5pt, weak: false)
    strong(it)
  }

  _index()

  //********************************* CONTENT *********************************//

  // let _head_slide(content) = {
  //     set page(footer: none)   
  //     text(size:50pt, weight: "semibold")[#content]
  //     v(-.45cm)
  //     _divider()
  //     pagebreak()
  // }

  // show heading: it => {
  //     set align(left + horizon)
  //     if it.level != none {
  //       if it.level == 1 {
  //         _head_slide(it.body)
  //         [#it]
  //         v(-.6cm)
  //         _divider()
  //       } else {
  //         pagebreak()
  //         text(weight: "semibold")[#it]
  //         v(-.5cm)
  //         _divider()
  //       }
  //     }
  // }

  set page(
    margin: (top: 3em, bottom: 1em),
    header: [
      #let current_sec = context query(selector(heading).before(here())).last()
      #context {
        pad(x:-1.9cm)[
          #box(fill:color-2, inset: 20pt, outset: 5pt, width:page.width)[
            #align(left + horizon)[
              #text(fill:white)[
                #v(0.1cm)
                #current_sec
              ]
            ]
          ]  
        ]
      }
      
    ],
  )
  

  content
}

