# NCUT Thesis Typst

北方工业大学本科生学士学位论文（毕业设计）Typst 非官方模板，依据2026版写作规范。

## 从 GitHub 开始

```sh
git clone https://github.com/zrll12/ncut-thesis-typst.git
cd ncut-thesis-typst
typst compile --font-path fonts main.typ thesis.pdf
```

需要安装 Typst 编译器（本机已安装并使用0.15.1验证）。macOS可用 `brew install typst`；其他系统参见 [Typst 官方安装说明](https://github.com/typst/typst#installation)。本模板仅用 Typst 内置功能，不需要安装第三方包，也不需要发布到 Typst Universe 才能生成PDF。

边写边生成：`typst watch --font-path fonts main.typ thesis.pdf`。也可执行 `make build` 或 `make watch`，输出位于 `build/thesis.pdf`。

修改 main.typ 的信息和正文。请同时保留 cover.typ 与 template.typ。字体需自行配置，见 [字体说明](fonts/README.md)。

## 在 Typst 网页版使用

1. 打开 [Typst](https://typst.app/)，新建空白项目。
2. 上传 main.typ、template.typ 和 cover.typ，选择 main.typ 为主文件。
3. 若项目缺少指定字体，上传自己有权使用的字体文件；核对项目使用的实际字体名称。
4. 编辑后自动生成预览，导出PDF。

不要求发布包；GitHub仓库源码与 Typst Universe 包是两种分发方式。

## 要发布成 Typst Universe 模板吗

当前仓库是直接使用的源码模板，**尚未发布到 Typst Universe**。直接导入 `"template.typ"` 即可，不支持将GitHub网址当作 `@preview` 包名。

如果以后希望用户从模板库一键创建，或运行 `typst init @preview/包名:版本`，才需要发布模板包：

1. 添加 `typst.toml`，定义名称、版本、入口、作者、许可证、说明及 `[template]` 部分。
2. 按Universe命名规则选择一个带独特前缀的名称，明确非官方身份。
3. 将样式作为包入口，将用户编辑的main.typ放入模板目录并改为包导入，提供模板缩略图。
4. 选定开源许可证，确认所有随包分发资源的授权。
5. 按官方流程向 `typst/packages` 提交Pull Request，待审核合并。仅推送本GitHub仓库不会自动出现在Universe。

官方参考：[包使用与本地包](https://github.com/typst/packages#readme)、[manifest与模板格式](https://github.com/typst/packages/blob/main/docs/manifest.md)、[发布流程](https://github.com/typst/packages/tree/main/docs)。

---

# 北方工业大学本科论文 Typst 模板（2026）

依据用户提供的《北方工业大学本科生学士学位论文（毕业设计）写作规范（2026版）》（教字〔2026〕10号），适用于以中文撰写的本科论文。非官方模板。示例内容不是完整学位论文。

## 开始使用

1. 保持 `main.typ`、`template.typ` 和 `cover.typ` 在同一文件夹。
2. 修改 `main.typ` 顶部的论文信息、中英文摘要和关键词；在下方撰写正文。
3. 在该文件夹中运行：

```sh
typst compile main.typ thesis.pdf
# 边写边编译：
typst watch main.typ thesis.pdf
```

也可将这三个文件上传到 Typst 网页项目，选择 main.typ 为入口。已在本机 Typst 0.15.1 编译通过，示例共11页。

字体：正文需要宋体（SimSun）与 Times New Roman，标题需要黑体。模板黑体优先使用本机 STHeiti，回退到 Heiti SC；宋体缺失时回退到 Songti SC。Windows 用户可将 template.typ 的 hei 改成 `("Times New Roman", "SimHei")`。严格提交时，请使用学院认可的宋体、黑体字体，并在 Typst 中配置正确的字体名称；字体文件不随模板分发。数学字体保留 Typst 默认数学字体，避免用不支持数学排版的正文字体替换。

## 已实现的格式

| 项目 | 模板处理 |
| --- | --- |
| 页面 | A4；上、左25.4 mm；下、右20.5 mm |
| 题名页 | 中英文题名22 pt；信息黑体22 pt；题名及信息行距37 pt；提交日期到日 |
| 前置部分 | 题名页、声明、中英文摘要、目录依次独立分页；默认不显示页码和页眉 |
| 正文 | 宋体12 pt，数字及西文 Times New Roman，首行缩进2字，采用23.4 pt基线间距（中文Word行距兼容设置） |
| 标题 | 章标题16 pt，节、条标题14 pt；左顶格；每章另页；编号1、1.1、1.1.1 |
| 目录 | 自动生成至三级，12 pt；逐级缩进0、1、2字符，点引导线，页码右对齐 |
| 页眉页码 | 自正文开始固定页眉9 pt；正文页码从1开始，页底居中10.5 pt，后置部分接续 |
| 图 | 按章编号；图题在下，黑体9 pt，题前6 pt，图号后空2字宽 |
| 表 | 按章编号；表题在上，黑体10.5 pt，题后6 pt；表内9 pt；三线表1.5/0.5/1.5 pt |
| 公式 | 居中，右侧按章编号（2.1）；自动引用 |
| 文献 | 引文方括号上标；首次引用顺序自动编号；重复引用沿用；文末仅列已引用项；10.5 pt、悬挂2字、行间距20.475 pt |
| 脚注 | 页底9 pt，①②等圈码，每页重新编号 |
| 后置部分 | 参考文献、致谢、附录另页，自动列入目录；分别按10.5 pt、16 pt、16 pt标题排版 |

Typst 的 `leading` 是两行行盒之间的空白，不是最终基线距离。正文现采用12 pt字号、12 pt行盒及11.4 pt行间空白，实测相邻正文行基线差为23.4 pt；这是本模板用于中文Word 1.5倍行距的兼容设置。规范没有直接指定23.4 pt；若学院提供的Word母版有不同的实际间距，可在 `thesis.with` 中加入 `body-line-height: 24pt` 等设置。不能将12 pt乘1.5得到的18 pt直接等同于Word中文字体的1.5倍行距。

封面使用独立样式：中文题名、学院、专业、姓名、学号、指导教师、校外导师及日期全部为黑体22 pt；英文题名为Times New Roman 22 pt。依照本次明确要求，数字及西文字母统一使用Times New Roman，包括标题编号、学号和日期数字；封面中文仍为黑体。封面行盒固定22 pt、行间空白15 pt，实测基线间距37 pt；每个信息项独立成段，首行缩进44 pt，多行回行顶格。中英文题名和日期居中。去除了规范未要求的额外校名大标题。

Typst行距参数说明：[Paragraph](https://typst.app/docs/reference/model/par/)，行盒参数说明：[Text](https://typst.app/docs/reference/text/text/)。

## 写作方法

### 章节

```typst
= 绪论
== 研究背景
=== 研究现状
正文内容。
```

章节内容可拆到多个文件，通过 `#include "chapters/intro.typ"` 引入。原生图、表、公式和交叉引用写法见 main.typ。插入图片时，将图中的 rect 替换为 `image("assets/example.png", width: 120mm)`，注意图片尺寸一般不超过145 × 215 mm。表格使用 `three-line-table`，在表头后保留 `table.hline(stroke: .5pt)`。数字列可按需要使用 table 的 align 参数扩展辅助函数。

附录：`#back-heading("附录 B 程序清单")`；致谢：`#back-heading("致谢")`。附录若需要额外的图表编号体系，可另行扩展，当前默认沿用正文最后一章的计数器；示例附录未使用图表公式。

### 文献

正文用 `#cite-ref("key")`，文末 `#references((key: [完整著录文本.],))`。key需唯一；编号不需要手工维护，缺少被引用条目会报错。文末采用2字宽的序号列与正文列，超长参考文献自动悬挂缩进。它是人工著录、自动排序方案，不是BibTeX/CSL自动格式化方案，不应同时混用原生 @key 或 bibliography。

请按学校附录C及GB/T 7714—2025逐条录入文献类型、作者、出版信息、日期、网址和永久标识符等。作者不多于3人全部列出；超过3人列前3人及“等”或“et al”；每条以半角句点结束。模板不自动校验这些字段。示例仅有2条文献用于验证引用机制，不满足毕业论文数量要求。

### 声明文本

原规范只说明应有原创性声明及使用授权说明，没有附固定文本。模板明确使用占位内容；请向学院取得完整文本并通过 `declaration: [完整声明文本]` 传入 thesis.with，再按学院要求签字。模板中的签名位置和声明标题版式属于实现选择。

## 提交前核对

- 中文题名一般不超过25字；各级标题一般不超过15字且不使用标点。
- 中文摘要一般300～1000字；关键词3～8个；英文摘要与中文对应。
- 中文正文一般不少于10000字；艺术、设计类以设计作品为主的正文不少于5000字。
- 参考文献不少于20篇，其中外文不少于5篇，并体现时效性。
- 本模板不自动统计上述篇幅、语种及文献数量，也不会填造内容以达标。
- 学院可制定细则；若有学院封面、声明页、字体或前置页码要求，应据此调整。规范未明确前置页码、页眉距边界、章标题上下额外留白，模板采用无前置页码、Typst默认页眉位置的实现选择；标题块显式保留行间空白，避免将“段前段后0”误实现为相邻字形挤在一起。
- 当前面向中文论文；外文论文需要调整摘要顺序及语言，英语正文不少于8000词、对应中文摘要一般500～600字；日语正文不少于10000字、对应中文摘要不少于600字。

## 文件

- main.typ：个人信息、示例正文和参考文献，主要编辑入口。
- template.typ：可复用样式及辅助函数。
- cover.typ：独立封面样式。
- example.pdf：已编译的版式演示。
- README.md：使用说明与实现边界。

## 第三次修订（v3）

- 修复标题替换规则丢失正常行间空白的问题。正文到节标题、连续标题及标题到正文均保留明确间隔，不再将标题直接贴在前一段上。
- 对数字和英文字母显式应用Times New Roman，覆盖标题、图表题等局部字体，避免回退成黑体数字。
- 封面保留独立22 pt字号、固定37 pt基线间距；六个信息项逐项成段，首行44 pt缩进，日期完整且居中。
- 新PDF以v3文件名交付，避免与旧预览混淆。正文常规行距保持23.4 pt。

## 参考文献行距修订

参考文献字号10.5 pt；按与正文一致的中文Word兼容比例，基线间距设为20.475 pt。段内换行与相邻条目使用同一基线节奏，条目间不另加空白段落，悬挂缩进21 pt。若学院母版有明确的实际行距，可通过 `references(entries, line-height: 21pt)` 调整。
