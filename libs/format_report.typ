// cover generater
#let cover(
  title: "Experiment Title",
  experiment_date: "2021/1/1",
  group: "1A",
  author_id: "A00B000C",
  author: "Namename",
  submission_date: "2021/12/31",
) = {
  page(paper: "a4", numbering: none)[
    #set text(font: ("Arial", "Yu Gothic"), lang: "ja", weight: "bold")
    #set par(spacing: 2.2em)
    #set align(center)
    #v(25%)

    #text(
      size: 35pt,
      weight: "bold",
      title,
    )
    #v(15%)

    実験日: #experiment_date

    提出者: #group #author_id \
    #author

    提出日: #submission_date
  ]
}

// reference item
#let bibitem(body) = {
  figure(
    kind: "bib",
    numbering: "1)",
    supplement: none,
    body,
  )
}

#let setup(body) = {
  // page settings
  set page(
    paper: "a4",
    numbering: "1",
    margin: (top: 35.01mm, bottom: 30mm, left: 30mm, right: 30mm),
  )

  // text settings
  set text(
    font: ("Times New Roman", "Yu Mincho"),
    size: 10.5pt,
    lang: "ja",
  )

  // paragraph settings
  set par(
    leading: 1.1em,
    justify: true,
    first-line-indent: (amount: 1em, all: true),
    spacing: 1.2em,
  )

  // heading settings
  show heading: it => {
    set block(below: 2em)
    let sizes = (
      16pt,
      14pt,
      13pt,
    )
    set text(
      font: ("Arial", "Yu Gothic"),
      size: sizes.at(it.level - 1, default: 10.5pt),
      weight: "bold",
    )
    it
  }
  set heading(numbering: (..nums) => {
    let pos = nums.pos()
    if pos.len() == 1 {
      numbering("1.", ..pos)
    }
  })

  // figure settings
  show figure: it => {
    set block(above: 2em)
    set text(
      font: ("Arial", "Yu Gothic"),
      size: 10pt,
      weight: "bold",
    )
    set align(left)
    it
  }
  show figure.where(kind: table): set figure.caption(position: top)

  // reference settings
  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure and el.kind == "bib" {
      context {
        let num = counter(figure.where(kind: "bib")).at(it.target).first()
        super[#link(it.target)[#text(fill: red)[#num\)]]]
      }
    } else {
      it
    }
  }

  body
}
