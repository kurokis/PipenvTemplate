rem カレントディレクトリを実行したバッチファイルの親ディレクトリにする
cd /d %~dp0
cd /d ..

rem pipをアップグレード
pip install --upgrade pip

rem pipenvをインストールする
pip install pipenv 

rem 環境変数を変更し、カレントディレクトリ以下に仮想環境をインストールさせる
set PIPENV_VENV_IN_PROJECT=1

rem 仮想環境をデプロイ(--devオプションで開発用パッケージもインストールする)
pipenv install --dev

pause