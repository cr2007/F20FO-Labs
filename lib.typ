#let question(question, marked: false, level: 2) = {
  show heading: it => {
    text(
      fill: if marked {rgb("C00000")} else {rgb("00B0F0")},
      font: "Microsoft Sans Serif",
      question
    )
  }

  heading(question, level: level)
}
