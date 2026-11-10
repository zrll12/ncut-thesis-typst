// 封面独立样式。二号 = 22pt；固定行距 = 37pt；首行缩进 = 44pt。
#let cover(title: "", title-en: none, college: "", major: "", author: "", student-id: "", supervisor: "", external-supervisor: "无", date: "") = {
  let hei = ("Times New Roman", "STHeiti", "Heiti SC")
  // 封面全部指定为22pt，行盒22pt + leading15pt = 固定37pt。
  // 信息项逐项独立成段，只有首行缩进44pt，多行回行顶格。
  let cover-text(content, centered: false, indent: 0pt) = block(width: 100%, above: 0pt, below: 0pt, inset: (bottom: 15pt))[
    #set text(font: hei, size: 22pt, weight: "regular", top-edge: 19pt, bottom-edge: -3pt)
    #set par(justify: not centered, first-line-indent: if centered { 0pt } else { (amount: indent, all: true) }, leading: 15pt, spacing: 15pt)
    #if centered { align(center, content) } else { par(content) }
  ]
  v(20mm)
  cover-text(centered: true)[#title#if title-en != none and title-en != "" and title-en != [] { linebreak(); text(font: "Times New Roman", size: 22pt, title-en) }]
  v(15mm)
  for field in (
    [学院：#college], [专业：#major], [姓名：#author],
    [学号：#student-id], [指导教师：#supervisor], [校外导师：#external-supervisor],
  ) { cover-text(indent: 44pt, text(font: hei, size: 22pt, field)) }
  v(1fr)
  cover-text(centered: true, date)
}
