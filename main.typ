#import "template.typ": *
#show: thesis.with(
  title: "面向学位论文的排版方法研究",
  title-en: "A Study of Typesetting Methods for Academic Theses",
  college: "信息学院", major: "计算机科学与技术", author: "张三",
  student-id: "202200000000", supervisor: "李四", external-supervisor: "无",
  date: "2026年6月1日",
  abstract: [此处填写中文摘要。摘要应简明、确切地展示论文核心内容，说明研究目的、方法、结果与结论，重点突出结果和结论。中文摘要一般为300～1000字。本段仅为模板填写提示，提交前应替换为真实研究摘要。],
  keywords: ("学位论文", "排版方法", "自动编号"),
  abstract-en: [Replace this paragraph with an English abstract corresponding to the Chinese abstract. Present the purpose, methods, results, and conclusions of the research. This is sample text for demonstrating the template.],
  keywords-en: ("academic thesis", "typesetting", "automatic numbering"),
)

= 绪论
== 研究背景
本文用于演示北方工业大学本科生学士学位论文的基本版式。正文中文为宋体，数字与西文字母如 Typst、2026 使用 Times New Roman。引用示例#cite-ref("standard")。所有示例文字与数据均应在提交前替换。

本模板以学校写作规范为依据#cite-ref("school")。再次引用同一文献时沿用相同序号#cite-ref("standard")。此处演示脚注#footnote[注释使用圈码，放在当前页底端，每页重新编号。]，另一条注释用于验证同页连续编号#footnote[这是一条补充说明，不代替参考文献引用。]。
== 研究内容
=== 技术路线
介绍研究目的、方法与论文结构。正文各章使用一级标题，各节和条分别使用二级和三级标题。

= 方法与实现
== 模型描述
每章另起一页，图、表、公式分别按章编号。变量采用斜体，单位、数字及描述性下标采用正体，例如 @eq-energy。
$ E = m c^2 $ <eq-energy>

此页脚注从①重新开始#footnote[用于检查跨页后的脚注编号。]。

#figure(
  rect(width: 120mm, height: 35mm, stroke: .5pt, fill: none)[#align(center + horizon)[输入数据 → 处理方法 → 结果分析]],
  caption: [研究流程示意图],
) <fig-flow>

如 @fig-flow 所示，图题位于图下方。实际插图建议不超过14.5 cm × 21.5 cm。

#figure(
  three-line-table(columns: (1fr, 1fr, 1fr),
    table.header([样本编号], [距离 / cm], [速度 / (m/s)]),
    table.hline(stroke: .5pt),
    [1], [10], [2.5],
    [2], [12], [3.0],
  ), kind: table, supplement: [表], caption: [实验数据示例],
) <tab-data>
#text(size: 9pt)[资料来源：用于排版演示的虚构数据。]

== 结果分析
此处填写结果分析。真实论文应报告可验证的研究过程和研究结果。
$ y = a x + b $ <eq-linear>

= 结论
此处填写总体结论，说明核心观点、研究局限与未来工作。不要将各章小结简单拼接为结论。

#references((
  standard: [GB/T 7713.1—2025 信息与文献 编写规则 第1部分：学位论文[S].],
  school: [北方工业大学教务处. 北方工业大学本科生学士学位论文（毕业设计）写作规范（2026版）：教字〔2026〕10号[Z]. 2026.],
))

#back-heading("致谢")
此处填写对导师及提供支持的组织、个人的感谢。文字应真诚简洁、实事求是。

#back-heading("附录 A 补充材料")
此处放置补充数据、推导或程序。非文本附件应在本页列出上传至管理系统的压缩包名称。
