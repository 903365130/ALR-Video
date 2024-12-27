@echo off
setlocal enabledelayedexpansion

rem 设置输入和输出文件夹
set "input_folder=D:\BaiduNetdiskDownload\AI\266"
set "output_folder=D:\ALR-V\video\266_AI"

rem 检查并创建输出文件夹
if not exist "%output_folder%" mkdir "%output_folder%"

rem 遍历输入文件夹中的所有 .yuv 文件
for %%f in ("%input_folder%\*.yuv") do (
    rem 获取文件名（不含扩展名）
    set "filename=%%~nf"

    rem 提取文件名中的 x, y, z 部分
    for /f "tokens=1,2,3 delims=_" %%a in ("!filename!") do (
        set "x=%%a"
        set "y=%%b"
        set "z=%%c"
    )

    rem 提取分辨率和帧率
    set "resolution=1920x1080"  rem 分辨率固定为 1920x1080
    set "framerate=!z:~0,2!"    rem 提取帧率（假设帧率是 z 的前两个字符）

    rem 构造输出文件夹路径
    set "subfolder=%output_folder%\!x!"
    if not exist "!subfolder!" mkdir "!subfolder!"

    rem 使用 ffmpeg 进行压缩
    ffmpeg -f rawvideo -pix_fmt yuv420p -s !resolution! -r !framerate! -i "%%f" -c:v libx265 -preset medium "!subfolder!\!filename!.265"

    rem 检查是否生成成功
    if exist "!subfolder!\!filename!.265" (
        echo Compressed "%%f" to "!subfolder!\!filename!.265"
    ) else (
        echo Failed to compress "%%f"
    )
)

echo All files processed.
pause