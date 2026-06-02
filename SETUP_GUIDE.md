# 彩色随机转盘 - 桌面应用程序

## 📋 项目概述

这是一个完整的Python桌面应用程序，具有以下功能：
- 从Excel读取数据生成彩色转盘
- 随机旋转抽奖
- 动态数据刷新
- 实时结果显示

## 📁 项目文件

```
d:\风吹哪页读哪页\
├── main.py              # 主程序文件
├── README.md            # 本说明文档
└── sample.xlsx          # 示例Excel文件（可选）
```

## 🚀 快速开始

### 第一步：安装依赖

打开 **PowerShell** 或 **命令提示符**，运行以下命令：

```powershell
# 安装 openpyxl（用于读取Excel文件）
pip install openpyxl

# 可选：如果Python不在系统PATH中，使用完整路径
python -m pip install openpyxl
```

### 第二步：运行程序

在 PowerShell 中进入程序所在目录，运行：

```powershell
# 进入程序目录
cd "d:\风吹哪页读哪页"

# 运行程序
python main.py
```

或者直接在文件夹中创建 `run.bat` 文件，双击即可运行：

```batch
@echo off
cd /d "%~dp0"
python main.py
pause
```

### 第三步：使用程序

1. **选择Excel文件**：点击"📁 选择Excel文件"按钮，选择包含数据的Excel文件
2. **查看名单**：右侧会显示读取到的所有选项
3. **开始抽奖**：点击"🎪 开始抽奖"，转盘会自动旋转
4. **查看结果**：转盘停止后，中奖者会显示在结果区域
5. **刷新数据**：修改Excel后点击"🔄 刷新数据"重新加载

---

## 📦 打包成 EXE 文件

### 第一步：安装PyInstaller

```powershell
pip install pyinstaller
```

### 第二步：打包程序

在 PowerShell 中进入程序目录，运行：

```powershell
# 进入程序目录
cd "d:\风吹哪页读哪页"

# 打包成单个EXE文件
pyinstaller -F -w main.py

# 参数说明：
# -F        生成单个exe文件（不生成文件夹）
# -w        不显示命令行窗口（只显示GUI）
# main.py   源文件
```

### 第三步：找到生成的EXE文件

打包完成后，在 `dist` 文件夹中会找到 `main.exe` 文件。

```
d:\风吹哪页读哪页\
├── main.py
├── main.spec
├── build\                  # 构建文件夹（可删除）
├── dist\
│   └── main.exe            # ← 生成的可执行文件
└── README.md
```

---

## 🖥️ 创建桌面快捷方式

### 方法一：手动创建（推荐）

1. **找到 EXE 文件**
   - 打开 `d:\风吹哪页读哪页\dist\` 文件夹
   - 找到 `main.exe` 文件

2. **创建快捷方式**
   - 右键点击 `main.exe`
   - 选择"发送到" → "桌面（创建快捷方式）"
   - 快捷方式会自动创建在桌面上

3. **双击快捷方式打开程序**
   - 在桌面上找到快捷方式
   - 双击即可运行程序

### 方法二：通过命令创建（高级）

1. 打开 PowerShell **以管理员身份运行**

2. 运行以下命令：

```powershell
# 创建快捷方式
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\彩色转盘.lnk")
$Shortcut.TargetPath = "d:\风吹哪页读哪页\dist\main.exe"
$Shortcut.WorkingDirectory = "d:\风吹哪页读哪页\dist"
$Shortcut.Description = "彩色随机转盘 - 在线抽奖工具"
$Shortcut.IconLocation = "d:\风吹哪页读哪页\dist\main.exe"
$Shortcut.Save()
Write-Host "快捷方式已创建到桌面！"
```

3. 桌面上会出现"彩色转盘"快捷方式

### 方法三：使用批处理文件

在 `dist` 文件夹中创建 `create_shortcut.bat` 文件：

```batch
@echo off
REM 创建桌面快捷方式
setlocal enabledelayedexpansion

REM 获取当前脚本所在目录的完整路径
for /f "tokens=*" %%A in ('cd') do set "CURRENT_DIR=%%A"

REM 创建VBS脚本用于创建快捷方式
(
echo Set oWS = WScript.CreateObject("WScript.Shell"^)
echo sLinkFile = oWS.SpecialFolders("Desktop"^) ^& "\彩色转盘.lnk"
echo Set oLink = oWS.CreateShortcut(sLinkFile^)
echo oLink.TargetPath = "!CURRENT_DIR!\main.exe"
echo oLink.WorkingDirectory = "!CURRENT_DIR!"
echo oLink.Description = "彩色随机转盘"
echo oLink.Save
) > temp_shortcut.vbs

cscript temp_shortcut.vbs
del temp_shortcut.vbs

echo 快捷方式已创建到桌面！
pause
```

然后双击这个批处理文件即可。

---

## 📝 Excel 数据格式

### 标准格式

```
学生名单          ← 第一行是表头（会被自动跳过）
张三
李四
王五
赵六
孙七
李八
吴九
```

### 数据要求

- ✅ 数据必须在第一列
- ✅ 第一行是表头（会自动跳过）
- ✅ 实际数据从第二行开始
- ✅ 支持中文、英文、数字、符号
- ✅ 自动过滤空白单元格
- ✅ 支持较长的文本（超过8个字会被截断显示）
- ❌ 不支持合并单元格
- ❌ 不支持公式（只读取显示值）

### 完整示例

```
姓名
Alice
Bob
Charlie
Diana
Eve
Frank
Grace
Henry
Ivy
Jack
```

---

## 🎨 程序界面说明

### 左侧：转盘区域
- **转盘**：显示从Excel读取的选项，每个扇形一种颜色
- **指针**：固定在转盘顶部，指向的位置就是中奖结果
- **开始抽奖按钮**：点击启动转盘旋转动画
- **结果显示**：转盘停止后显示中奖者

### 右侧：控制面板
- **选择Excel文件**：浏览并选择数据源
- **刷新数据**：重新加载当前Excel文件
- **当前文件**：显示已选择的文件名
- **当前名单**：显示所有选项的列表
- **项目计数**：显示总共有多少个选项

---

## 🔧 打包常见问题

### Q1：打包后找不到 main.exe

**A：** 打包完成后，需要进入 `dist` 文件夹查找。完整路径应该是：
```
d:\风吹哪页读哪页\dist\main.exe
```

### Q2：打包失败，提示找不到 openpyxl

**A：** 确保已经安装了所有依赖：
```powershell
pip install openpyxl
pip install pyinstaller
```

### Q3：打包的EXE太大怎么办？

**A：** 这是正常的。PyInstaller 会把整个 Python 解释器打包进去。如果想减小体积，可以使用 `--onefile` 参数（已经使用）。文件大小通常在 100MB 左右。

### Q4：运行EXE时提示 "模块未找到" 或 "找不到openpyxl"

**A：** 这可能是打包时没有包含所有依赖。重新打包时使用：
```powershell
pyinstaller -F -w -p venv\Lib\site-packages main.py
```
（假设虚拟环境名为 `venv`）

### Q5：EXE运行时闪退怎么办？

**A：** 去掉 `-w` 参数重新打包，这样会显示错误信息：
```powershell
pyinstaller -F main.py
```

---

## 🎯 功能详细说明

### 1. 转盘显示
- 根据Excel数据行数动态生成扇形
- 每个扇形使用不同颜色（从16种预设颜色循环使用）
- 扇形内显示对应的选项文本

### 2. 转盘旋转
- 点击"开始抽奖"后，转盘随机旋转5-8圈
- 使用缓动函数实现"先快后慢"的动画效果
- 旋转持续约3秒

### 3. 结果计算
- 转盘停止后，根据指针位置（顶部）计算中奖结果
- 结果立即显示在界面下方

### 4. 数据刷新
- 点击"刷新数据"重新加载当前Excel文件
- 转盘会自动更新分块数、颜色和文字
- 清空之前的抽奖结果

---

## 💻 系统要求

- **操作系统**：Windows 7 及以上
- **Python 版本**：Python 3.6 及以上（仅在开发和打包时需要）
- **内存**：最低 200MB（打包后的EXE运行时）
- **磁盘空间**：约 150MB（用于存储EXE文件）

---

## 📚 代码说明

### 主要类和函数

#### WheelSpinner 类
管理转盘的绘制和旋转逻辑：
- `set_items(items)`：设置转盘选项
- `draw()`：绘制转盘
- `spin(duration)`：启动旋转
- `get_winner()`：获取中奖者

#### ExcelReader 类
处理Excel文件读取：
- `read_first_column(file_path)`：读取第一列数据

#### WheelApp 类
主应用程序窗口，管理UI和事件处理

### 核心算法

1. **转盘绘制**：
   - 计算每个扇形的角度：`slice_angle = 360 / 数据条数`
   - 使用 Canvas.create_arc() 绘制扇形
   - 根据角度计算文字位置和显示

2. **旋转动画**：
   - 使用线程处理动画，避免UI卡顿
   - 缓动函数：`ease_progress = 1 - (1 - progress)²`
   - 约50fps的刷新率

3. **中奖计算**：
   - 标准化转盘角度到 0-360 度
   - 反向计算指针所指向的扇形：`winner_index = (360 - rotation) / slice_angle`

---

## 🛠️ 自定义修改

### 修改颜色
在 `main.py` 中修改 `COLOR_PALETTE` 列表：

```python
COLOR_PALETTE = [
    '#FF6B6B',  # 修改这些颜色代码
    '#FFA700',
    # ... 其他颜色
]
```

### 修改动画时长
在 `_on_start_btn_click()` 方法中修改：

```python
self.wheel.spin(duration=3.0)  # 改为 2.0 表示2秒
```

### 修改转圈数
在 `_spin_animation()` 方法中修改：

```python
random_rotations = 5 + random.random() * 3  # 改为其他数值
```

### 修改窗口大小
在顶部常量中修改：

```python
WINDOW_WIDTH = 1200
WINDOW_HEIGHT = 700
```

---

## 📞 故障排除

| 问题 | 解决方案 |
|------|--------|
| Python找不到 | 检查Python是否正确安装，或使用完整路径：`C:\Python39\python.exe main.py` |
| openpyxl导入错误 | 运行 `pip install openpyxl` 安装依赖 |
| Excel文件无法读取 | 确保Excel格式为 .xlsx 或 .xls，避免合并单元格 |
| 转盘显示不正常 | 检查Excel数据是否在第一列，第二行开始 |
| EXE运行缓慢 | 这是正常的，PyInstaller打包的应用启动会略慢 |

---

## 📖 相关资源

- [Python官方网站](https://www.python.org/)
- [openpyxl文档](https://openpyxl.readthedocs.io/)
- [PyInstaller文档](https://pyinstaller.org/)
- [Tkinter官方文档](https://docs.python.org/3/library/tkinter.html)

---

## ✅ 完整步骤总结

1. **安装依赖**：`pip install openpyxl`
2. **运行程序**：`python main.py`
3. **安装打包工具**：`pip install pyinstaller`
4. **打包程序**：`pyinstaller -F -w main.py`
5. **找到EXE**：`dist\main.exe`
6. **创建快捷方式**：右键 → 发送到 → 桌面

祝你使用愉快！🎉

---

## 版本历史

- v1.0 (2026-05-26)：初始版本，包含基本功能

---

**作者**：[Your Name]  
**更新日期**：2026年5月26日
