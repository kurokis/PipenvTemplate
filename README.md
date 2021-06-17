# 1クリックで仮想環境デプロイ

pipenvによる仮想環境セットアップとスクリプト実行をそれぞれ1クリックで行えるようにするためのテンプレート

## セットアップ方法

**前提**：Windows環境で[Python 3](https://www.python.org/)がインストールされていること

**手順**：

setup_files\setup.batを実行すると、このプロジェクト直下に各種ライブラリが含まれた仮想環境が構築される。

インストールされるライブラリは下表を参照のこと。

| インストール手順 | インストールされるライブラリ |
|----------------|----------------------------|
| setup_files\setup.batを実行 | Pipfileの[packages]に記載のもの |
| setup_files\setup_dev.batを実行（応用編） | 上記 + Pipfileの[dev-packages]に記載のもの |


仮想環境の構築場所はsetup.bat内の`set PIPENV_VENV_IN_PROJECT=1`で規定している。
setup.batを実行後はプロジェクト直下に.venvフォルダが作成される。
その中に各種ライブラリが格納されており、仮想環境に入るとこの中のライブラリが呼び出せるようになる。


## 実行方法

### 方法1. 仮想環境に入ってからpythonファイル実行

start_shell.batをダブルクリック（または、コマンドプロンプトを開きこのプロジェクト直下で`pipenv shell`コマンドを実行する）

仮想環境に入ったことを確認し（ターミナル先頭に(.venv)と表示されるはず）、pythonファイルを実行

```sh
python helloworld.py
```

### 方法2. 仮想環境に入らずにpythonファイル実行(一発実行)

`pipenv run`コマンドを活用すると仮想環境に入る手間を省くことができる。

```sh
pipenv run python helloworld.py
```

定型作業を自動化するようなユースケースでは、上記のようなコマンドをあらかじめバッチファイルに記載しておくとよい。
（参考：samples\run_helloworld.bat）

## 削除方法

setup_files\remove.batを実行すると、セットアップ時に作成されたPipfile.lockおよび.venvフォルダが削除される。

仮想環境まわりのトラブルが発生した場合は、このバッチファイルで一度仮想環境をアンインストールし、再度setup.batを実行するとよい。
