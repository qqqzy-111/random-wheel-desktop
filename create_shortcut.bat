@echo off
REM ==========================================
REM 彩色随机转盘 - 创建快捷方式脚本
REM ==========================================

chcp 65001 > nul
cls
echo.
echo =====================================
echo    创建桌面快捷方式
echo =====================================
echo.

REM 进入脚本所在目录
cd /d "%~dp0"

REM 检查EXE文件是否存在
if not exist "dist\main.exe" (
    echo [错误] 未找到 dist\main.exe 文件！
    echo 请先运行 build.bat 打包程序
    pause
    exit /b 1
)

REM 获取完整路径
for /f "tokens=*" %%A in ('cd') do set "CURRENT_DIR=%%A"
set "EXE_PATH=%CURRENT_DIR%\dist\main.exe"
set "SHORTCUT_PATH=%USERPROFILE%\Desktop\彩色转盘.lnk"

REM 创建VBS脚本（用于创建快捷方式）
(
echo Set oWS = WScript.CreateObject("WScript.Shell"^)
echo Set oLink = oWS.CreateShortcut("%SHORTCUT_PATH%"^)
echo oLink.TargetPath = "%EXE_PATH%"
echo oLink.WorkingDirectory = "%CURRENT_DIR%\dist"
echo oLink.Description = "彩色随机转盘 - 在线抽奖工具"
echo oLink.IconLocation = "%EXE_PATH%"
echo oLink.Save
) > temp_create_shortcut.vbs

REM 执行VBS脚本
cscript temp_create_shortcut.vbs

REM 删除临时文件
del temp_create_shortcut.vbs

echo.
echo =====================================
echo    成功！
echo =====================================
echo.
echo 快捷方式已创建到桌面：彩色转盘.lnk
echo 现在可以双击桌面上的快捷方式来运行程序
echo.
pause
