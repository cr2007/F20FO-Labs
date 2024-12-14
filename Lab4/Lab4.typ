#import "../lib.typ": question
#import "@preview/oxifmt:0.2.1": strfmt

#let data = yaml("../metadata.yml")
#let labNumber = 4

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

#heading("Lab 4.2: Examine and Repair MBR")

\ #question("What is MBR for?")

The #strong("M")aster #strong("B")oot #strong("R")ecord (MBR) is used for booting the system and accessing the partitions on the disk.

\ #line()

#question("What sector is it located at?")

It is in #underline[*Sector 0*].

\ #line()

#question("How many primary partitions can it define?")

MBR can define a maximum of #underline[*4* primary partitions].

Primary Partitions can contain a file system or an operating system.

\ #line()

#question("What are the last 2 bytes?")

#strong[`55 AA`] are the last 2 bytes in MBR.

\ #line()

#question(marked: true, [How many times does the sequence of values `55 AA` occur in the MBR?])

#grid(
  columns: 2,
  gutter: 0.25cm,
  align: (horizon, horizon),
  [The sequence of values `55 AA` appears #underline[3 times] in the MBR.
  
  - Address `0805`#sub("HEX")
  - Address `0F05`#sub("HEX")
  - Address `01FE`#sub("HEX")
  ],
  grid.cell(
    rowspan: 2,
    align: top,
    figure(caption: "Screenshot of the Master Boot Record (MBR) of the disk", image(
      alt: "A screenshot of the Master Boot Record",
      "images/MBR-Sector-Editor.png",
    ))
  )
)

#line()
#pagebreak()

#question(marked: true, "What is the size of the partition?")

*10 megabytes*

Partition Size: `00 00 50 00`#sub("16") #sym.arrow 20480 sectors

20480 sectors #sym.times 512 bytes = 10,485,760 bytes

10,485,760 bytes / 1024 = 10,240 Kbytes

10,240 Kbytes / 1024 = 10 Mbytes

\ #line()

#question(marked: true, "Do the sizes correspond with what you can see in My Computer?")

#grid(
  columns: 2,
  gutter: 0.5cm,
  [Yes, the total size corresponds to what I see in My Computer.],
  figure(
    caption: "Screenshot of the total size of the disk",
    image(
      alt: "Screenshot of the total size of the disk",
      height: 4.33cm,
      "images/Part2_Total-Size.png"
    )
  )
)

#line()

#heading("Modify MBR")

#question(marked: true, "Is the footer (the MBR signature) fixed? Attach a screenshot")

#align(center, image(
  alt: "Screenshot of the fixed MBR signature"
  "images/MBR-Signature-Footer.jpg",
))

#line()
#line()
