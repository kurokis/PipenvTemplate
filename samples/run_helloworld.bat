rem カレントディレクトリを実行したバッチファイルのディレクトリにする
cd /d %~dp0

rem スクリプト実行
py -m pipenv run python helloworld.py

pause