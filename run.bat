@echo off
REM ==========================================
REM 风吹哪页读哪页 - 快速运行脚本
REM ==========================================

chcp 65001 > nul
cls
echo.
echo =====================================
echo    公主的阅读宝典 - 加载中...
echo =====================================
echo.

REM 进入脚本所在目录
cd /d "%~dp0"

REM 检查Python是否安装
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到Python安装
    echo 请从 https://www.python.org 下载并安装Python
    echo 安装时请勾选 "Add Python to PATH"
    pause
    exit /b 1
)

REM 检查openpyxl是否安装
python -c "import openpyxl" > nul 2>&1
if %errorlevel% neq 0 (
    echo [警告] 未检测到openpyxl库
    echo 正在自动安装依赖...
    pip install -r requirements.txt
)

REM 运行程序
echo [信息] 启动程序...
python main.py

pause
