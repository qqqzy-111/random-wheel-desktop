@echo off
REM ==========================================
REM 彩色随机转盘 - 打包脚本
REM ==========================================

chcp 65001 > nul
cls
echo.
echo =====================================
echo    彩色随机转盘 - 打包工具
echo =====================================
echo.

REM 进入脚本所在目录
cd /d "%~dp0"

REM 检查Python是否安装
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到Python安装！
    echo 请从 https://www.python.org 下载并安装Python
    pause
    exit /b 1
)

REM 安装依赖
echo [步骤1/3] 安装依赖包...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [错误] 安装依赖失败！
    pause
    exit /b 1
)

REM 安装PyInstaller
echo [步骤2/3] 安装PyInstaller...
pip install pyinstaller
if %errorlevel% neq 0 (
    echo [错误] 安装PyInstaller失败！
    pause
    exit /b 1
)

REM 打包程序
echo [步骤3/3] 开始打包程序...
echo 这可能需要几分钟时间，请耐心等待...
echo.
pyinstaller -F -w main.py
if %errorlevel% neq 0 (
    echo [错误] 打包失败！
    pause
    exit /b 1
)

REM 打包完成
echo.
echo =====================================
echo    打包完成！
echo =====================================
echo.
echo [成功] EXE文件已生成到：dist\main.exe
echo.
echo 接下来的步骤：
echo 1. 打开 dist 文件夹找到 main.exe
echo 2. 右键 main.exe 选择 "发送到" -^> "桌面（创建快捷方式）"
echo 3. 双击桌面上的快捷方式即可运行程序
echo.
echo 提示：如需创建快捷方式，请运行 create_shortcut.bat
echo.
pause
