#import "../lib.typ": question, redColour
#import "@preview/oxifmt:0.2.1": strfmt

#let data = yaml("../metadata.yml")
#let labNumber = 6

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

#heading("Lab 6.1: Hashing")

#heading(level: 2, "Lab 6.1.1: Creating Hashes")

\ #question(level: 3, "Note the hashes and the filename")

#figure(caption: "A list of file hashes and the corresponding file names", image(
  alt: "The list of hashes and the filenames",
  height: 5.75cm,
  "images/File-Hashes_List.png"
))

#line()

#question(marked: true, level: 3, "Based on the above computer hashes, can you tell which of the files are exactly the same?")

*`doc5.doc`* and *`doc7.doc`* contain the same computer hashes.

\ #figure(caption: "A list of file hashes with the same file hashes ", image(
  alt: "A screenshot of a list of file hashes, and the same computer hashes highlighted",
  height: 5.78cm,
  "images/Same-File-Hashes.png"
))

#line()

#heading(level: 2, "Lab 6.1.2: Seeing the changes")

Create a new text document.

In this file, type in "*Fundamentals of Digital Forensics AED 10.00*"

Save this file on your Desktop as *`price.txt`*, and close it.

Calculate the MD5 hash of this file.

#question(level: 3, "Record this.")

`e9ec0e0eaf23289e9e627586624e662b` | *price.txt*

#line()

Now make a copy of the file "*price.txt*" and call it "*copy of price.txt*". *DO NOT MODIFY* or *OPEN* this file.

Calculate the MD5 hash of this file.

#question(level: 3, "Record this.")

`e9ec0e0eaf23289e9e627586624e662b` | *copy of price.txt*

#line()

Now compare the hash values.

\ #question(level: 3, "What can you learn from the hash of these two files? Why?")

From the hash of these two values, we can learn that the contents within the 2 files are identical, since they produce the same MD5 hash.

#line()

Next, open the file price.txt you created earlier.

Change the statement "*Fundamentals of Digital Forensics AED 10.00*" to "*Fundamentals of Information Security AED 1000*"

Save the file (over-write it)

Just as before, calculate the hash of this edited file.

Compare the hash values to the ones you found before.

#question(level: 3, "What can you see and why?")

#align(center, image(
  alt: "A screenshot of the file hash for price.txt and 'copy of price.txt'",
  "images/Different-File-Hash-price-txt.png"
))

We can see the hash values for both the files changed.
This is because both the `.txt` files have different values within them.

#line()

#heading("Lab 6.2: Digital Forensic Imaging and Analysis")

#heading(level: 2, "Lab 6.2.1: Autopsy")

\ #question(level: 3)[What is the MD5 hash for the "Murder.E01 image?"]

`e2c63db524627af7fdad7d7d4b7339e7`

#line()

#question(level: 3, "Identify Device ID and the timeZone:")

*Device ID:* `bf759dd7-22ff-40a4-9fdf-6b31fc52aade`

*timeZone:* Asia/Dubai

#line()
#pagebreak()

#question(level: 3, "Click on Murder.E01, to expand it. What does the red X mean beside the Documents folder?")

The red X indicates that the file was either deleted or unallocated.
Autopsy highlights these files with a red cross to draw attention to them using forensic analysis.

#line()

#question(marked: true, level: 3, "What sort of evidence can you identify for Murder.EO1 by using Autopsy? Report your findings.")

(Hint: Click on Murder.E01 look inside Documents, any related images or Documents.
Also look at the visited sites).
Record metadata details related to the evidence you found including MD5 hash for each evidence file.

\
Using Autopsy, many elements are revealed in the case of Murder.E01, including File Metadata, Deleted Files, File Hashes and Signatures, and Timeline Analysis.
Examining the data, it's evident that the suspect engaged in frequent visits to online gun forums, conducted searches on shotgun operation, and accessed instructional materials aimed at novice gun users.
Notably, an RTF file indicates the suspect booked a room on October 24, 2010, coinciding with the date of the murder.
These findings strongly implicate the suspect as the perpetrator of the crime.

#line()

#heading(level: 2, "Lab 6.2.2.: FTK (Forensic ToolKit")

// #question(level: 3, "Take a look at the different overview views FTK can offer to view files. Do you believe it helps with analysis? Why is this useful for analysis?")

// #line()

#question(marked: true, level: 3, "What is the total number of files processed in this evidence file (Murder.E01) by FTK?")

After extracting the files from the evidence file, it shows that there are *12,072* files processed in this evidence file.

#align(center, image("images/Lab6.2.2_FTK.png"))

#line()

#question(marked: true, level: 3, "How many deleted files?")

There are *6,115* deleted files in the evidence file.

#align(center, image(
  height: 6.5cm,
  "images/Lab6.2.2_DeletedFiles.png"
))

#line()

#question(marked: true, level: 3, "How many graphic files?")

There are *3,184* graphic files in the evidence file.

#align(center, image("images/Lab6.2.2_GraphicFiles.png"))

#line()

#heading(level: 2, "MAC Times")

\ #question(
  marked: true,
  level: 3,
  "Do you notice anything? Do some of the graphics files have their modified date before creation and accessed dates? If yes, why do you think that happened? If all the dates correspond, you can write no as an answer."
)

Analysis of the suspect's accessed dates reveals manipulation.
Examination of MAC times for recent graphic files indicates discrepancies, with access dates consistently set to one day prior to creation and modification dates.
Notably, the access time for these files consistently appears as 13:00, implying deliberate tampering by the suspect to conceal their activities.

\
#line()
#line()
