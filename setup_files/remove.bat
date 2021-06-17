rem カレントディレクトリを実行したバッチファイルの親ディレクトリにする
cd /d %~dp0
cd /d ..

rem 削除してよいか確認する
@echo off
set /p choice="Delete Pipfile.lock and .venv in the parent directory? (y/n) "
if /i {%choice%}=={y} (goto :yes)

exit

:yes
rem delete Pipfile.lock
del /s Pipfile.lock

rem delete virtual environment within current directory
del /s /q .venv
rmdir /s /q .venv

pause