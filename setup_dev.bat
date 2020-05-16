rem カレントディレクトリを実行したバッチファイルのディレクトリにする
cd /d %~dp0

rem pipをアップグレード
C:\Windows\py.exe -m pip install --upgrade pip

rem pipenvをインストールする
C:\Windows\py.exe -m pip install pipenv 

rem 環境変数を変更し、カレントディレクトリ以下に仮想環境をインストールさせる
set PIPENV_VENV_IN_PROJECT=1

rem 仮想環境をデプロイ(--devオプションで開発用パッケージもインストールする)
C:\Windows\py.exe -m pipenv install --dev

pause