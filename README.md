# WEB+DB PRESS Vol.134 連載「Perl Hackers Hub」サンプルコード

技術評論社刊「WEB+DB PRESS Vol.134」の連載「Perl Hackers Hub」第78回「Perl Webアプリケーションのリプレイス」（須藤将史著）のサンプルコードです。

## Setup

1. [Docker Desktopをインストール](https://docs.docker.com/get-docker/)
2. [Perlをセットアップ](https://github.com/masashi-sutou/perl-webdb-134-sample-api/blob/main/setup.md)
3. 以下のmakeコマンドを上から順に実行する

```bash
# 1. モジュールのインストール(失敗する場合、setup.mdのFAQも参照)
$ make setup

# 2. APIサーバーを起動
$ make start

# 3. テストが成功すればセットアップ完了です
$ make test
```

- `make help` で利用可能なコマンドを確認できます

## cpanfileの編集

- cpanfileを編集（追加・削除・バージョン更新 etc）した場合は以下のコマンドを実行する

```bash
$ make update-cpanfile-snapshot
```
