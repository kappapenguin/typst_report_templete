# Typst Report Templete

Typstの実験レポートテンプレート。
Git Submoduleで取り込むことで利用する。

---

## Setup

`templete`にsubmoduleとして`clone`し、プロジェクトファイル内に展開する

### bash

```bash
git submodule add https://github.com/kappapenguin/typst_report_templete.git templete
cp -rn templete/assets ./
echo '#import "templete/libs/format_report.typ": *' > main.typ.tmp
tail -n +2 templete/templete_report.typ >> main.typ.tmp
mv -n main.typ.tmp main.typ
rm -f main.typ.tmp
```

### PowerShell

```bash
git submodule add https://github.com/kappapenguin/typst_report_templete.git templete
if (!(Test-Path assets)) { cp -r templete/assets . }
'#import "templete/libs/format_report.typ": *' | sc -enc utf8 main.typ.tmp
gc -enc utf8 templete/templete_report.typ | select -skip 1 | ac -enc utf8 main.typ.tmp
mv main.typ.tmp main.typ -ea 0
rm main.typ.tmp -ea 0
```

## Project

セットアップ完了後、プロジェクト直下は以下の構成になる。

```text
project/
├── assets/
├── main.typ
└── templete/
    ├── assets/
    ├── libs/
    │   └── format_report.typ
    ├── templete_report.typ
    └── README.md
```

## Usage

main.typを編集して利用する

- コンパイル

```bash
typst compile main.typ
```

- リアルタイムプレビュー

```bash
typst watch main.typ
```

## Reset

展開したファイルを削除する

### bash

```bash
rm -rf assets
rm -f main.typ main.typ.tmp

```

### PowerShell

```powershell
rm -r -force assets -ea 0
rm main.typ, main.typ.tmp -ea 0

```
