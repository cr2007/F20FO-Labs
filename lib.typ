#let redColour = rgb("C00000")

#let question(question, marked: false, level: 2) = {
  show heading: it => {
    text(
      fill: if marked {redColour} else {rgb("00B0F0")},
      font: "Microsoft Sans Serif",
      question
    )
  }

  heading(question, level: level)
}
