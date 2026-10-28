#import "./libs/format_report.typ": *

// 表紙の出力
#cover(
  title: "〇〇〇の実験",
  experiment_date: "2026/12/31",
  group: "1A",
  author_id: "A12B345C",
  author: "山田太郎",
  submission_date: "2026/12/31",
)

#show: setup
#counter(page).update(1)

= 実験の目的
テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト

テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト

= 使用原理

@fig-test は実験装置@table-test は実験結果を示している@bib-text1。

#figure(
  image("./assets/fig.png", height: 5cm),
  caption: [実験の図],
)<fig-test>

#figure(
  image("./assets/table.png", height: 5cm),
  kind: table,
  caption: [実験の表],
)<table-test>

= 実験装置

= 実験方法

#pagebreak()
= 結果

= 考察

#pagebreak()
= 参考文献

+ #bibitem[参考文献1]<bib-text1>
+ #bibitem[参考文献2]<bib-text2>
