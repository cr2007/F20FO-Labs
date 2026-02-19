#import "../lib.typ": question, redColour
#import "@preview/oxifmt:0.2.1": strfmt

#let data = yaml("../metadata.yml")
#let labNumber = 5

#let unicodeA = "A".to-unicode()
#let charToInt(c) = c.to-unicode() - unicodeA
#let intToChar(i) = str.from-unicode(i + unicodeA)

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

#heading("Lab 5.1: Symmetric Key Encryption")

#heading(level: 2, "Shift Cipher")

#let caesarEncrypt(plaintext, shift) = {
  [#for c in upper(plaintext) {
    let o = c.to-unicode()

    if o >= unicodeA or o <= unicodeA + 25 {
      let i = charToInt(c)
      intToChar(calc.rem(i + shift, 26))
    }
  }]
}

\ #question(marked: true, level: 3, "Decrypt the following substitution Cipher, identify the key used, and show both the key and plaintext.")

\
#strong(text(fill: redColour, "Kbtp fp fkclojxqflk xylrq zroobkq bsbkqp"))

*Plaintext:* News is information about current events

*Key:* 23 (-3)

\ #line()

#question(level: 3, [What does "*CAESAR*" become with a shift of 6?])

"*CAESAR*" with a shift of 6 becomes "#strong(caesarEncrypt("CAESAR", 6))"

\ #line()

#question(level: 3, [What key do we need to make "*CAESAR*" become "*MKOCKB*"?])

*Key:* 10

#line()

#let shiftCipherTable() = [
  #show table.cell.where(x: 0): it => {
    set text(white)
    strong(it)
  }

  #table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (left, center, center, center, center, center, center, center, center, center, center, center,),
    fill: (x, _) => if x == 0 {black},
    stroke: 0.5pt,
    "Plain", "C", "D", "E", "H", "I", "N", "P", "R", "S", "T", "Y",
    "Cipher", "X", "J", "L", "A", "Z", "E", "V", "K", "H", "O", "M",
  )
]

#shiftCipherTable()

#question(marked: true, level: 3, [Given the ciphertext *JLXKMVO OAZH*, using the above table identify the plaintext.])

*DECRYPT THIS*

#line()

#heading(level: 2, [Python -- Reverse Printing])

#question(marked: true, level: 3, "Upload a screenshot of your code and output")

#align(center, image(
  alt: "Screenshot of a Python program output of a Reverse Cipher",
  height: 7.16cm,
  "images/ReverseCipher-Python.jpg"
))

#line()

#question(level: 3, "This is a really simple code that simply prints a string backwards - does this offer any security?")

This code is not considered a secure method of encryption.
It's a very simple transformation that can be easily reversed and doesn't have any sort of key.

It doesn't have any level of confidentiality, integrity, and authenticity that any decent secure encryption algorithm should provide.

#line()

#heading(level: 2, [Python -- Substitution Cipher])

\ #text(fill: redColour, [
  It is currently set to be the Caesar Cipher, encrypt only with a shift of 3.
  Can you modify the code so that it asks the user:

  - Whether they want to encrypt or decrypt the message?
  - Which key they wish to use?
])

#question(marked: true, level: 3, "Upload a screenshot of the (modified) code and output)")

#grid(
  columns: 2,
  gutter: 0.5mm,
  image(
    alt: "Source Code for the Caesar Cipher Python Code",
    height: 10.46cm,
    "images/Caesar-Cipher_Python-Code.png",
  ),
  image(alt: "The output of the modified code", "images/CaesarCipher-Output.jpg")
)

#line()
#pagebreak()

#heading(level: 2, "Frequency Analysis")

#question(level: 3, "Review the following ciphertext and use frequency analysis to crack it - this is a trial and error process and will take you some time, depending how good you are with puzzles!")

\ #strong[VEP HYXHLVHTP MO AWFJYFLT H RFNEPS HJNEHAPV FL VEFU ZHC FU  

VEHV FV FU PHUC VM KPKMSFUP VEP IPCZMSY MS IPCNESHUP, HLY  

EPLRP VEP RFNEPS HJNEHAPV. VEFU FU FKNMSVHLV, APRHWUP FO  

VEP UPLYPS EHU VM IPPN VEP RFNEPS HJNEHAPV ML H NFPRP MO  

NHNPS, VEP PLPKC RHL RHNVWSP VEP NHNPS, YFURMXPS VEP IPC, HLY  

SPHY HLC RMKKWLFRHVFMLU VEHV EHXP APPL PLRSCNVPY ZFVE FV.  

EMZPXPS FO VEP IPC RHL AP RMKKFVVPY VM KPKMSC FV FU JPUU  

JFIPJC VM OHJJ FLVM PLPKC EHLYU.]

You need to start by counting the frequency of the letters and enter them into this table.

#table(
  columns: (1fr,) * 13,
  align: center,
  [*a*], [*b*], [*c*], [*d*], [*e*], [*f*], [*g*], [*h*], [*i*], [*j*], [*k*], [*l*], [*m*],
  [], [], [], [], [], [], [], [], [], [], [], [], [],
  [*n*], [*o*], [*p*], [*q*], [*r*], [*s*], [*t*], [*u*], [*v*], [*w*], [*x*], [*y*], [*z*],
  [], [], [], [], [], [], [], [], [], [], [], [], [],
)

Then compare these values against the second table (which is the expected frequency of letters within English), the most frequent letters in each should be a straight swap - the more text you have to look at the more accurate these straight swaps become.
The remaining swaps are educated guesses.

#let frequencyAnalysisTable() = [
  #show table.cell: it => {
    if calc.even(it.y) [
      #set text(white)
      #strong(it)
    ] else {it}
  }

  #table(
    columns: (1fr,) * 13,
    rows: 4,
    align: center,
    fill: (_, y) => if calc.even(y) {black},
    stroke: 0.5pt,
    [a(B)], [b], [c(Y)], [d], [e(H)], [F(i)], [g], [h(A)], [i(K)], [j(L)], [k(M)], [l(N)], [m(O)],
    [7], [0], [12], [0], table.cell(fill: rgb("00B050"), text("26")), table.cell(fill: rgb("00B050"), text("27")), [0], table.cell(fill: rgb("00B050"), text("32")), [6], [9], [11], table.cell(fill: rgb("00B050"), text("20")), [18],
    [n(P)], [o(N)], [p(E)], [q], [r(C)], [s(R)], [t(G)], [u(S)], [v(T)], [w(U)], [x(V)], [y(D)], [z(W)],
    [16], [5], table.cell(fill: rgb("00B050"), text("55")), [0], [14], [17], [2], [17], table.cell(fill: rgb("00B050"), text("35")), [4], [4], [11], [4]
  )
]

\
#frequencyAnalysisTable()

\
#raw("the advantage on building a cipher alphabet in this way is that it is easy to memorise the keyword or keyphrase, and hence the cipher alphabet. this is important, because in the sender has to keep the cipher alphabet on a piece on paper, the enemy can capture the paper, discover the key, and read any communications that have been encrypted with it. however in the key can be committed to memory it is less likely to fall into enemy hands.")

\ #line()
#pagebreak()

#heading(level: 2, "Vigenère Cipher")

\ #question(level: 3)[See if you can decrypt the following message that has been encrypted using the Vigenère cipher: `Mjxa xl Xxotgggm Rbrwmg`.
The passphrase (keyword) used was `TCPIP`.]

#show table.cell.where(x: 0): it => {
  set text(white)
  strong(it)
}

#let vigenereCiphertext = upper("MjxaxlXxotgggmRbrwmg")
#let vigenereKey = "TCPIP"

#let vigenereKeyArray(message, key) = {
  let textLength = vigenereCiphertext.len()
  let keyLength = key.len()

  vigenereKey * int(textLength / keyLength) + vigenereKey.slice(0, calc.rem(textLength, keyLength))
}

#let decryptVigenere(ciphertext, key) = {
  for i in range(ciphertext.len()) {
    let ci = charToInt( ciphertext.at(i) )
    let keyToInt = charToInt( key.at( calc.rem(i, key.len()) ) )

    intToChar(calc.rem-euclid(ci - keyToInt, 26))
  }
}


#table(
  columns: (auto,) + (auto,) * vigenereCiphertext.len(),
  rows: 3,
  align: horizon + center,
  fill: (x, y) =>
    if x == 0 {black}
    else if y == 2 {rgb("FFE599")},
  stroke: 0.5pt,
  table.header(
    [Key],
    ..vigenereKeyArray(vigenereCiphertext, vigenereKey).clusters()
  ),
  [Ciphertext], ..vigenereCiphertext.clusters(),
  [Plaintext], ..decryptVigenere(vigenereCiphertext, vigenereKey).clusters(),
)

This is Vigenère Cipher.

\ #line()

#question(level: 3, "What are the security advantages of the Vigenère Cipher over a simple substitution cipher?")

Vigenère Cipher has a major security advantage over a simple substitution cipher.
Due to its polyalphabetic nature, i.e. using multiple substitution alphabets, it makes frequency analysis a lot more challenging.
Since a Vigenère Cipher requires a keyword to encrypt and decrypt the message, if a keyword is long enough and chosen in random, it can significantly increase the complexity of breaking the cipher command to a simple substitution cipher.

And since there are 26 possible ways to shift the position of the keyword, it makes a lot more secure than a substitution cipher, which has only one fixed substitution alphabet.

\ #line()

#heading("Lab 5.2: Asymmetric Encryption")

#heading(level: 2, "GNU Privacy Guard (GPG)")

\ #align(center, rect(
  stroke: 0.5pt, image(
    alt: "A screenshot of the OpenPGP certificate",
    height: 15%,
    "images/OpenGPG-Certificate.png"
  )
))

#question(marked: true, level: 3, "What happens? What have you just achieved?")

Upon decryption using my private key, I successfully accessed the contents of the encrypted file, originally encrypted with my colleague's private key, and transmitted securely.
This achievement underscores the utilization of secure communication protocols, ensuring the safe exchange of sensitive information.

#line()

// #question(level: 3, "In what circumstances might you sign using a digital signature?")

// \ #line()

// #question(level: 3, "In what circumstances might you encrypt an entire email?")

// \ #line()

#pagebreak() // Can be deleted

#heading(level: 2, "Null Cipher")

#question(marked: true, level: 3, "Can you work out the null cipher message? It uses a fixed point in each word.")

#strong[T]he #strong[h]airy #strong[e]lephant, #strong[c]ame #strong[a]nd #strong[t]ook #strong[s]alt #strong[a]nd #strong[t]ea #strong[o]ver #strong[n]ear #strong[t]he #strong[h]azardous #strong[e]nergy #strong[m]aking #strong[a]pparatus #strong[t]oday.

The cat sat on the mat.

#line()

#heading(level: 2, "Word Shifting")

#question(level: 3, "Can you work out the shifted message below?")

```
One reason people lie is  to  achieve personal power. Achieving personal  power is helpful for someone who pretends to be more confident than he really is. For example, one of my friends threw a party at his house last month. He asked me to come to his party and bring a date. However, I didn't have a girlfriend. One of my other friends, who had a date to go to the party with, asked me about my date. I didn't want to be embarrassed, so I claimed that I had a lot of work to do. I said I could easily find  a date even better than his if I wanted to. I also told him that his date was ugly. I achieved power to help me feel  confident; however, I embarrassed my friend and his date. Although this  lie helped me at the time, since then it has made me look down on myself.
```

To achieve power find a confident friend lie.

#line()

#heading("Lab 5.3: Password Cracking")

#heading(level: 2, "Dictionary Attack")

#question(marked: true, level: 3, "Generate an MD5 hash and try to crack one or more passwords. Upload screenshots of your MD5 hash and John output for the cracked(?) password(s).")

#align(center, image(
  height: 9.5cm,
  "images/Dictionary-Attack_Output.jpg"
))

#line()
#line()
