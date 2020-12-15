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


なお、仮想環境の構築場所はsetup.bat内の`set PIPENV_VENV_IN_PROJECT=1`で規定している。
setup.batを実行後はプロジェクト直下に.venvフォルダが作成される。
その中に各種ライブラリが格納されており、仮想環境に入るとこの中のライブラリが呼び出せるようになる。


## 実行方法

### 方法1. 仮想環境に入ってからpythonファイル実行

ターミナルを開き、このプロジェクト内にカレントディレクトリを移動させる。
その後`pipenv shell`コマンドで仮想環境に入る。（`py -m`の意味は補足を参照）

```sh
py -m pipenv shell
```

仮想環境に入ったことを確認し（ターミナル先頭に(.venv)と表示されるはず）、pythonファイルを実行

```sh
python helloworld.py
```

### 方法2. 仮想環境に入らずにpythonファイル実行(一発実行)

あえて仮想環境に入るほどでもない場合（例：便利スクリプトを実行）は、
`pipenv run`コマンドを活用することで一発で実行することができる。

```sh
py -m pipenv run python helloworld.py
```

便利スクリプト作成時は、上記のようなコマンドをバッチファイルに記載しておくとよい。

（参考：samples\run_helloworld.bat）

## アンインストール方法

setup_files\uninstall.batを実行すると、セットアップ時に作成されたPipfile.lockおよび.venvフォルダが削除される。

仮想環境まわりのトラブルが発生した場合は、このバッチファイルで一度仮想環境をアンインストールし、再度setup.batを実行するとよい。

## 補足

### Python launcherについて

本プロジェクトではpythonやpipを環境変数に追加していないことに起因する実行不可トラブルを未然防止するため、
[python launcher](https://docs.python.org/3/using/windows.html#launcher)を活用したsyntaxを採用している。
Python launcherはWindows環境でpythonをインストールするとデフォルトで追加され、基本的にはこちらを使うことが推奨される。
ただし、pipやpipenv実行時にコマンド先頭に`py -m`を追加する必要があるので注意が必要である。

（例）仮想環境下でのhelloworld.pyの実行

Launcherを使わない場合：`pipenv run python helloworld.py`

Launcherを使った場合：`py -m pipenv run python helloworld.py`


Python launcherのメリデメを以下にまとめる。

メリット
 - pythonを環境変数に追加した/していないに起因するトラシューの未然防止
 - pipを環境変数に追加した/していないに起因するトラシューの未然防止
 - 適切なバージョンのpython interpreterが自動で選択される

デメリット
 - pipやpipenvを実行するときはコマンド先頭に`py -m`を追加する必要があり煩雑