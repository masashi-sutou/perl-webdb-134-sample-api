## Setup Perl

- Perlの開発に必要なツールをインストールします

### plenv install

- perlのバージョン管理ツール
- https://github.com/tokuhirom/plenv

```bash
$ git clone https://github.com/tokuhirom/plenv.git ~/.plenv
$ echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.zshrc
$ echo 'eval "$(plenv init -)"' >> ~/.zshrc
$ git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
$ source ~/.zshrc

# api/.perl-version のバージョンを準備
$ plenv install 5.36.0

# This is perl 5, version 36, subversion 0 (v5.36.0) built の表示を確認
$ perl -v
```

### cpanm

- Perlモジュールをインストールするためのツール

```bash
$ plenv install-cpanm
```

### cpm

- cpanmよりも高速にモジュールをダウンロードできるライブラリ

```bash
# グローバルにインストール
$ curl -fsSL --compressed https://git.io/cpm | perl - install -g App::cpm
$ plenv rehash
$ cpm -V
```

### carton

- Perl版のmodule依存マネージャー
    - `Bundler` と似たもの
- Cartonがモジュール管理のために利用するファイルが `cpanfile`と `cpanfile.snapshot`
    - `Gemfile`, `Gemfile.lock`と似たもの

```bash
$ cpm install -g Carton
$ plenv rehash

# セットアップできたか確認
$ carton -v
```

## Setup Intellij IDEA
 
- 好きなIDEやEditorで開発できます
- Intellij IDEAはPerlの開発サポートが手厚いので利用推奨です

### perl plugin

- preference の plugins の Perl をインストールする
    - 詳細：https://github.com/Camelcade/Perl5-IDEA/wiki

### lib setting

パッケージ（.pm）をIntellij IDEAに知らせて、パッケージの関数名を提案させる

1. preference の Languages & Frameworks の Perl5 を選ぶ
2. リポジトリ名を選択して以下のフォルダを選び `Mark as: Perl5 libraies` を押す
    - `lib/`
    - `local/lib/perl5`

### plenv

1. preference の Languages & Frameworks の Perl5 を選ぶ
2. 歯車（⚙️）を押す → local → Add plenv Perl... を選ぶ
3. `~/.plenv/libexec/plenv` を選ぶ
    - 隠しフォルダは、Finder表示中に「⌘ + Shift + .」で表示
4. Apply を押して、OKを押す

## FAQ

### `http://localhost:5000` が繋がらない場合

- MacがMonterey以降の場合、システム環境設定 > 共有 > AirPlayレシーバー をOFFにする
