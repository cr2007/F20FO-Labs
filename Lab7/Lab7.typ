#import "../lib.typ": question, redColour
#import "@preview/oxifmt:0.2.1": strfmt

#let data = yaml("../metadata.yml")
#let labNumber = 7

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

#heading("Lab 7.1: VM and Autopsy")

#question("How much RAM is allocated to your VM?")

6 GB

#line()

// #question("Create a file on the desktop - use your imagination.")

// #line()

#heading(level: 2, "Lab 7.1.1.: Viewing a VM")

\ #question(marked: true, level: 3, "Using the Data Sources tree view can you find the data you put on the desktop? Upload a screenshot of your desktop in the quiz.")

#align(center, image(
  height: 7.15cm,
  "images/Lab7.1.1_Data-Sources.png"
))

#line()

// #heading("Lab 7.2: Procmon")

// #line()

#heading("Lab 7.3: Live Forensics")

#heading(level: 2, "Lab 7.3.1: Live Analysis")

\ #question(level: 3, "Note your USBMOUNT point")

`/media/csk/FIRE-0.3.5b`

#line()

#question(level: 3, "What does the Script command in Linux do?")

The `script` command takes a copy of everything which is output to the terminal and place it in a log file.

#line()

// #heading(level: 2, "Lab 7.3.2: Collective Live State Manually")

// #question(level: 3, "Are the same processes shown each time?")

// #line()

// #heading(level: 2, "Lab 7.3.3: Collecting Live State using Scripts")

// #line()

// #heading(level: 2, "Lab 7.3.4: Checking for Rootkits")

// #line()

// #heading(level: 2, "Lab 7.3.5: Offline Analysis of Live Data Collection")

// #line()

#pagebreak() // Can be deleted

#heading(level: 2, "Lab 7.3.6: Windows and Live Incident Response")

// #question(level: 3, "Unguided task: use an incident response disk (such as Helix), can be downloaded from this link:")

// #line()

\ #question(marked: true, level: 3,
  "Submit a paragraph detailing what you expect to find from the Windows system. After your live analysis, submit a list of what you recovered from the contents of RAM, the list of running processes and network connections. Did you find any content, which might be of interest to an investigation?"
)

From the Windows system, we expect to find active processes and any suspicious files that may be present in the system.
From the live analysis conducted, we recovered the following list of running processes.
From the list of running processes and network connections, we were able to discover processes mostly containing from:

+ Microsoft Edge
+ OneDrive
+ CTFmod
+ Ruby

There are no active network connections available in the Windows system, and overall, from the RAM contents, there was no content available that might be of interest to an investigation.
All the running processes are standard processes that exist in a Windows system, and there were no active network connections present in the system.

#line()
#line()
