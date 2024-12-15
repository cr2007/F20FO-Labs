#import "../lib.typ": question, redColour
#import "@preview/oxifmt:0.2.1": strfmt

#let data = yaml("../metadata.yml")
#let labNumber = 3

#set text(font: "Calibri")
#set line(length: 100%)

#align(center, [
  #text(
    size: 28pt,
    font: "Dubai",
    weight: "medium",
    strfmt("{} Lab {}", data.courseCode, labNumber),
  )\ \

  #text(
    font: "Segoe UI",
    weight: "semibold",
    size: 11pt,
    data.labTitles.at(labNumber - 1)
  )

  #text(
    font: "Segoe UI Variable",
    [#data.studentFirstName #data.studentLastName.slice(0,1) (#data.studentEmail)]
  )
])

#outline(indent: 0.5cm) \

#line(stroke: 0.25pt)
#pagebreak()

#heading("Lab 3.1: Number Systems")\

#question(marked: true, "Complete the following conversion table:")

#show table.cell.where(y: 0): it => {
  set text(white)
  it
}

#let tableSolution(value, base) = strong[
  #text(str(value), fill: redColour)#if base != 0 [#sub(str(base))]
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon + center,
  fill: (_, y) => if y == 0 {black},
  table.header([*Current State*], [*Binary (unsigned)*], [*Hexadecimal*]),
  tableSolution(203, 10), [11001011], tableSolution("CB", 16),
  tableSolution(10999, 10), tableSolution(10101011110111, 2), [2AF7],
  [54], tableSolution(110110, 2), tableSolution(36, 16)
)

#line()

#question(marked: true, "Complete the following table:")

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon + center,
  fill: (_, y) => if y == 0 {black},
  table.header([*Colour*], [*Hex Code RGB*], [*Decimal Code RGB*]),
  [Colour1], [AB 65 2F], [124 0 63],
  [Red], tableSolution("FF 00 00", 0), tableSolution(strfmt("255 0 0"), 0),
  [Green], tableSolution("00 FF 00", 0), tableSolution("0 255 0", 0),
  [Blue], tableSolution("00 00 FF", 0), tableSolution("0 0 255", 0),
  [White], tableSolution("FF FF FF", 0), tableSolution("255 255 255", 0),
) \

#line()

#heading("Lab 3.2: File Structure")
\
#heading(level: 2, "File Signatures")

#grid(
  columns: (auto, auto),
  align: (horizon, horizon),
  [
    #question(level: 3, marked: true, "What is the correct file extension for this file?")

    The correct file extension is `.jpeg`.

    #line(length:90%)

    #question(level: 3, marked: true, "What does it contain?")

    It contains a picture of a man wearing a white shirt and a striped tie.
  ],
  grid.cell(
    rowspan: 2,
    align: top,
    rect(stroke: 0.25pt, image("File1.jpeg"))
  )
)


\ #line()
#pagebreak()

#heading(level: 2, "JPEG Signature")

#question(level: 3, marked: true, "Can you identify which one was shot with a Canon camera? (Hint: use a hex editor)")

\
'_Img3.jpg_' was shot using a Canon camera.

When you open up the JPG image file using Frhed, the application marker displayed in the image contents was '*`FF E1`*', indicating that the image uses a #strong("Ex")changeable #strong("I")mage #strong("F")ormat (EXIF).

Upon further inspection of the file, using the hex editor Frhed, we were able to see the extra information showed within the file, including the fact that the image was shot with a Canon camera.

#line()

#question(level: 3, "Which of these images uses EXIF?")

- Img3.JPG

#line()

#heading("Lab 3.3: File Carving I")

\ #question(level: 3, "Can you see the PNG header in the file anywhere?")

Yes, the PNG header is visible in Offset `386 (0x182)`

\ #line()

#question(level: 3, "Note the location of the header and footer, so that you can easily find them again.")

- *Header:* Offset `386 (0x182)` to `389 (0x185)`\ (`.PNG`)

- *Footer:* Offset `3634 (0xe32)` to `3637 (0xe35)`\ (`IEND`)

\ #line()

#heading("Lab 3.4: File Carving II")

#question(marked: true, "In your document write a short description about what you retrieved.")

#grid(
  columns: (auto, auto),
  gutter: 0.15cm,
  align: (horizon, horizon),
  [The retrieved data reveals a total of eight distinct items.
  
  Among these items are a single video file encoded in AVI format, accompanied by a collection of four images in JPG format, although one image showed signs of potential corruption.
  
  Additionally, our examination uncovered a ZIP archive containing a solitary text file, alongside a pair of enigmatic empty files whose formats remain unidentified.],
  grid.cell(
    rowspan: 2,
    align: top,
    figure(caption: "Scalpel command execution", image(
      alt: "A screenshot of the result of a Scalpel command",
      "Scalpel-Command-Execution.png",
    ))
  )
)

#line()
#line()
