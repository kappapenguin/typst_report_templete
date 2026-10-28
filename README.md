# Typst Report Templete

Typstの実験レポートテンプレート。
Git Submoduleで取り込むことで利用する。

---

## Setup

`templete`にsubmoduleとして`clone`し、プロジェクトファイル内に展開する

### bash

```bash
git submodule add <このリポジトリのURL> templete
cp -rn templete/assets ./
echo '#import "templete/libs/format_report.typ": *' > main.typ.tmp
tail -n +2 templete/templete_report.typ >> main.typ.tmp
mv -n main.typ.tmp main.typ
rm -f main.typ.tmp
```

### PowerShell

```bash
git submodule add <このリポジトリのURL> templete
if (-not (Test-Path assets)) { Copy-Item -Recurse templete/assets . }
'#import "templete/libs/format_report.typ": *' | Set-Content -Encoding utf8 main.typ.tmp
Get-Content templete/templete_report.typ | Select-Object -Skip 1 | Add-Content -Encoding utf8 main.typ.tmp
Move-Item main.typ.tmp main.typ -ErrorAction SilentlyContinue
Remove-Item main.typ.tmp -ErrorAction SilentlyContinue
```

---

## Project

セットアップ完了後、プロジェクト直下は以下の構成になります。

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

---

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
