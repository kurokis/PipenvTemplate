rem カレントディレクトリを実行したバッチファイルの親ディレクトリにする
cd /d %~dp0
cd /d ..

rem pipをアップグレード
py -m pip install --upgrade pip

rem pipenvをインストールする
py -m pip install pipenv 

rem 環境変数を変更し、カレントディレクトリ以下に仮想環境をインストールさせる
set PIPENV_VENV_IN_PROJECT=1

rem 仮想環境をデプロイ(--deployオプションによりPipfile.lockの依存関係が古い場合はstatus_code 1を返して終了)
py -m pipenv install --deploy

pause