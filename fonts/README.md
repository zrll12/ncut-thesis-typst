# 字体

字体不随仓库分发。请自行安装有使用授权的宋体、黑体和 Times New Roman。
也可以将字体文件放在本目录，然后运行：

```sh
typst compile --font-path fonts main.typ thesis.pdf
```

字体文件已由 .gitignore 排除，避免意外上传。请使用 `typst fonts --font-path fonts` 查询实际字体家族名称，并对应修改 template.typ 和 cover.typ 中的字体设置。
