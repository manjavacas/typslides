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
      font_size -= 0.2pt
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