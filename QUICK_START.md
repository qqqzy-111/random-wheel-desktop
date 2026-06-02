# 彩色随机转盘 - 快速开始指南

## 🎯 5分钟快速开始

### 方式一：直接运行（最简单）

1. **打开文件夹** `d:\风吹哪页读哪页`

2. **双击** `run.bat` 文件
   - 程序会自动检查依赖并启动
   - 如果提示缺少依赖，会自动安装

3. **上传Excel文件**
   - 点击"📁 选择Excel文件"按钮
   - 选择你的Excel数据文件

4. **开始抽奖**
   - 点击"🎪 开始抽奖"按钮
   - 查看结果

### 方式二：使用Python命令

1. **打开 PowerShell** 或 **命令提示符**

2. **运行以下命令**：

```powershell
# 进入程序目录
cd "d:\风吹哪页读哪页"

# 安装依赖（首次运行时需要）
pip install -r requirements.txt

# 运行程序
python main.py
```

---

## 📦 打包成桌面应用（4步）

### 步骤1：安装打包工具

双击 `build.bat` 文件自动完成以下操作：
- ✅ 安装openpyxl
- ✅ 安装PyInstaller
- ✅ 打包程序

或者手动运行：

```powershell
# 安装PyInstaller
pip install pyinstaller

# 进入程序目录
cd "d:\风吹哪页读哪页"

# 打包程序
pyinstaller -F -w main.py
```

### 步骤2：找到生成的EXE文件

打包完成后，在 `dist` 文件夹中会有 `main.exe` 文件：

```
d:\风吹哪页读哪页\dist\main.exe
```

### 步骤3：创建快捷方式

**方法A（推荐）：自动创建**
- 双击 `create_shortcut.bat` 文件
- 快捷方式自动创建到桌面

**方法B：手动创建**
1. 打开 `dist` 文件夹
2. 右键点击 `main.exe`
3. 选择 "发送到" → "桌面（创建快捷方式）"

### 步骤4：使用快捷方式

- 在桌面找到快捷方式
- 双击即可运行程序
- 以后就可以像普通软件一样使用了

---

## 📝 准备Excel数据文件

### 格式要求

Excel文件中，数据应该这样放置：

| A列（第一列） |
|-------------|
| 姓名         | ← 第一行（表头，会被跳过）
| 张三         | ← 第二行开始是实际数据
| 李四         |
| 王五         |
| 赵六         |
| 孙七         |

### 注意事项

- ✅ 数据必须在第一列（A列）
- ✅ 第一行是表头（会自动跳过）
- ✅ 支持中文、英文、数字、符号
- ✅ 自动过滤空白行
- ❌ 不要在其他列放数据
- ❌ 不要使用合并单元格
- ❌ 不要使用公式（只读取显示的值）

### 多个Excel文件

可以为不同的场景准备多个Excel文件：
- `学生名单.xlsx` - 课堂点名
- `员工列表.xlsx` - 公司活动
- `奖品清单.xlsx` - 促销活动

每次选择对应的文件即可。

---

## 🆘 遇到问题？

### 问题1：双击run.bat后闪退

**解决方案**：
```powershell
# 打开PowerShell，进入目录
cd "d:\风吹哪页读哪页"

# 手动运行
python main.py

# 查看错误信息
```

### 问题2：Python not found（找不到Python）

**原因**：Python没有添加到系统PATH

**解决方案**：
1. 下载 [Python官方安装程序](https://www.python.org/downloads/)
2. 安装时**一定要勾选** "Add Python to PATH"
3. 重启电脑后重试

### 问题3：openpyxl import error

**解决方案**：
```powershell
pip install openpyxl --upgrade
```

### 问题4：打包失败或提示 "No module named 'openpyxl'"

**解决方案**：
```powershell
# 重新安装依赖
pip install openpyxl

# 重新打包
pyinstaller -F -w main.py
```

### 问题5：Excel文件无法读取

**检查清单**：
- [ ] Excel文件格式是 .xlsx 或 .xls
- [ ] 数据在第一列（A列）
- [ ] 第二行开始有数据
- [ ] 没有合并单元格
- [ ] 没有空的第一列

### 问题6：转盘显示错误或计算错误

**解决方案**：
```powershell
# 重新启动程序
python main.py

# 重新选择Excel文件
```

---

## 🎓 完整流程示例

### 示例：课堂点名

1. **准备Excel**：
   ```
   学生名单
   张三
   李四
   王五
   赵六
   孙七
   ```

2. **启动程序**：
   - 双击 `run.bat` 或桌面快捷方式

3. **选择文件**：
   - 点击"📁 选择Excel文件"
   - 选择 `学生名单.xlsx`

4. **查看名单**：
   - 右侧会显示所有学生名单

5. **开始抽奖**：
   - 点击"🎪 开始抽奖"
   - 转盘旋转后显示被点名的学生

6. **再次抽奖**：
   - 直接点击"🎪 开始抽奖"继续

---

## 💡 实用技巧

### 技巧1：快速切换数据

1. 在 `d:\风吹哪页读哪页` 文件夹中放多个Excel文件
2. 程序运行时点击"📁 选择Excel文件"
3. 选择不同的文件切换转盘内容

### 技巧2：实时修改数据

1. 修改Excel文件内容
2. 点击程序中的"🔄 刷新数据"
3. 转盘会立即更新

### 技巧3：修改程序外观

编辑 `main.py` 文件，修改以下部分：

```python
# 修改颜色列表
COLOR_PALETTE = [
    '#FF6B6B',  # 修改这里
    # ...
]

# 修改窗口大小
WINDOW_WIDTH = 1200
WINDOW_HEIGHT = 700

# 修改转盘旋转时长（秒）
self.wheel.spin(duration=3.0)  # 改为 2.0 就是2秒
```

然后保存，再运行 `build.bat` 重新打包。

---

## 📦 文件说明

| 文件名 | 说明 |
|--------|------|
| main.py | 主程序源代码 |
| run.bat | 快速运行脚本 |
| build.bat | 打包脚本 |
| create_shortcut.bat | 创建快捷方式脚本 |
| requirements.txt | 依赖列表 |
| SETUP_GUIDE.md | 详细安装说明 |
| QUICK_START.md | 本文件 |

---

## ✅ 检查清单

**首次运行前**：
- [ ] Python已安装
- [ ] 已运行 `run.bat` 或 `pip install -r requirements.txt`
- [ ] Excel文件已准备

**打包前**：
- [ ] 程序能正常运行
- [ ] 已运行 `build.bat` 或 `pyinstaller -F -w main.py`
- [ ] 在 `dist` 文件夹找到 `main.exe`

**上线前**：
- [ ] 已创建快捷方式
- [ ] 快捷方式能正常打开程序
- [ ] 程序功能正常

---

## 🚀 下一步

**想进一步定制程序？**

1. **修改颜色**：编辑 `COLOR_PALETTE`
2. **修改界面**：编辑 `WheelApp` 类的 `_create_ui()` 方法
3. **修改动画**：编辑 `_spin_animation()` 方法

有任何问题，查看 `SETUP_GUIDE.md` 获取更详细的说明。

---

**祝你使用愉快！🎉**

如有任何问题，请检查错误信息并参考 SETUP_GUIDE.md。
