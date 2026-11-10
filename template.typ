#import "cover.typ": cover
// 北方工业大学本科论文模板，依据教字〔2026〕10号。
#let song = ("Times New Roman", "SimSun", "Songti SC")
#let hei = ("Times New Roman", "STHeiti", "Heiti SC")
#let chapter-number() = counter(heading).get().first()
#let thesis(title: "", title-en: "", college: "", major: "", author: "", student-id: "", supervisor: "", external-supervisor: "无", date: "", body-line-height: 23.4pt, declaration: none, abstract: [], keywords: (), abstract-en: [], keywords-en: (), body) = {
  set document(title: title, author: author)
  set page(paper: "a4", margin: (top: 2.54cm, bottom: 2.05cm, left: 2.54cm, right: 2.05cm), numbering: none)
  set text(font: song, size: 12pt, lang: "zh", top-edge: .8em, bottom-edge: -.2em)
  // Word 中文宋体的1.5倍行距，采用23.4pt基线间距；可按学院要求覆盖。
  // bottom-edge 必须在基线下方，取负值。段间只延续行距，不额外加空行。
  set par(justify: true, first-line-indent: (amount: 2em, all: true), leading: body-line-height - 12pt, spacing: body-line-height - 12pt)
  // 明确覆盖标题、页码等局部样式中的西文数字字体。
  show regex("[A-Za-z0-9]+"): set text(font: "Times New Roman")
  set block(above: .5em, below: .5em)
  show math.equation: set block(above: 6pt, below: 6pt)
  show heading: it => {
    if it.level == 1 { pagebreak(weak: true) }
    if it.numbering != none and it.level == 1 {
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
      counter(math.equation).update(0)
    }
    block(width: 100%, above: 0pt, below: 0pt, inset: (top: if it.level == 1 { 0pt } else { 11.4pt }, bottom: 11.4pt))[
      #set par(first-line-indent: 0pt, leading: 13.3pt, spacing: 0pt)
      #set text(font: hei, size: if it.level == 1 { 16pt } else { 14pt })
      #if it.numbering != none { counter(heading).display(it.numbering); h(.5em) }
      #it.body
    ]
  }
  set heading(numbering: "1.1.1")
  set math.equation(numbering: n => context [（#chapter-number().#n）], number-align: right)
  set figure(gap: 0pt, numbering: n => context [#chapter-number().#n], supplement: [图])
  show figure.where(kind: table): set figure(supplement: [表])
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption: it => {
    let is-table = it.kind == table
    block(above: 0pt, below: 0pt, inset: (top: if is-table { 0pt } else { 6pt }, bottom: if is-table { 6pt } else { 0pt }))[
      #set text(font: hei, size: if is-table { 10.5pt } else { 9pt })
      #set par(first-line-indent: 0pt)
      #align(center)[#it.supplement #context counter(figure.where(kind: it.kind)).display(it.numbering)#h(2em)#it.body]
    ]
  }
  set footnote(numbering: n => context {
    let notes = query(footnote).filter(it => it.body != none)
    let note = notes.at(n - 1, default: none)
    if note != none {
      let p = note.location().page()
      let first = notes.position(it => it.location().page() == p)
      numbering("①", n - first)
    } else { numbering("①", n) }
  })
  show footnote.entry: set text(font: song, size: 9pt)
  cover(title: title, title-en: title-en, college: college, major: major,
    author: author, student-id: student-id, supervisor: supervisor,
    external-supervisor: external-supervisor, date: date)
  pagebreak()
  align(center, text(font: hei, size: 16pt)[原创性声明及使用授权说明])
  v(18pt)
  if declaration == none {
    [【请替换为学院确认的原创性声明及使用授权说明全文。此处为占位内容，不是学校公布的声明文本。】]
  } else { declaration }
  v(24pt)
  [作者签名：#h(35mm) 日期：#h(30mm)]
  pagebreak()
  // 中文规范未指定另设“中文摘要”页标题，仅保留摘要前缀。
  [#text(font: hei)[摘要：]#abstract]
  v(18pt)
  [#text(font: hei)[关键词：]#keywords.join("；")]
  pagebreak()
  align(center, text(font: "Times New Roman", size: 22pt, weight: "bold", title-en))
  v(18pt)
  block[
    #set text(font: "Times New Roman", lang: "en")
    #strong[Abstract:] #abstract-en
    #v(18pt)
    #strong[Keywords:] #keywords-en.join("; ")
  ]
  pagebreak()
  align(center, text(font: hei, size: 12pt)[目录])
  show outline.entry: it => {
    set text(size: 12pt)
    set par(first-line-indent: 0pt)
    let indent = (it.level - 1) * 12pt
    block(above: 0pt, below: 0pt, inset: (left: indent, bottom: 6pt))[
      #link(it.element.location())[#it.prefix()#if it.element.numbering != none { h(.5em) }#it.body()#h(.5em)#box(width: 1fr, repeat[·])#h(.5em)#it.page()]
    ]
  }
  outline(title: none, depth: 3, indent: 0pt)
  pagebreak()
  counter(page).update(1)
  set page(numbering: "1", number-align: center, header: align(center, text(font: ("SimSun", "Songti SC"), size: 9pt)[北方工业大学本科生学士学位论文（毕业设计）]), footer: context align(center, text(font: song, size: 10.5pt, counter(page).display("1"))))
  body
}

#let back-heading(title, size: 16pt) = {
  pagebreak(weak: true)
  show heading: it => align(center, block(above: 0pt, below: 0pt, inset: (bottom: 6pt), text(font: hei, size: size, it.body)))
  heading(level: 1, numbering: none, outlined: true, title)
}
#let three-line-table(columns: (), ..cells) = {
  set text(font: song, size: 9pt)
  set par(first-line-indent: 0pt)
  table(columns: columns, stroke: none, inset: (x: 8pt, y: 4.5pt),
    table.hline(stroke: 1.5pt), ..cells.pos(), table.hline(stroke: 1.5pt))
}
// 参考文献采用手工著录 + 自动顺序编码，避免默认 CSL 与2025版不一致。
#let reference(key) = context {
  let cites = query(metadata).filter(m => type(m.value) == dictionary and m.value.at("type", default: "") == "ncut-cite")
  let keys = cites.map(m => m.value.key).dedup()
  let n = keys.position(k => k == key)
  assert(n != none, message: "引文记录未找到")
  super(link(label("bib-" + key), [\[#(n + 1)\]]))
}
#let cite-ref(key) = { metadata((type: "ncut-cite", key: key)); reference(key) }
#let references(entries) = {
  back-heading("参考文献", size: 10.5pt)
  context {
    let cites = query(metadata).filter(m => type(m.value) == dictionary and m.value.at("type", default: "") == "ncut-cite")
    let keys = cites.map(m => m.value.key).dedup()
    set text(font: song, size: 10.5pt)
    set par(first-line-indent: (amount: 0pt, all: true), leading: .5em, spacing: .5em)
    for (i, key) in keys.enumerate() {
      assert(key in entries, message: "references 中缺少文献：" + key)
      block(above: 0pt, below: 0pt)[#metadata(key)#label("bib-" + key)#grid(columns: (2em, 1fr), [\[#(i + 1)\]], entries.at(key))]
    }
  }
}
