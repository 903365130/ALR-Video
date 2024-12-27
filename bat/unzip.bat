@echo off
setlocal enabledelayedexpansion

rem 设置输入文件夹
set "input_folder=D:\ALR-V\video\265_AI"

rem 遍历输入文件夹中的所有子文件夹，并处理其中的 .265 文件
for /r "%input_folder%" %%f in (*.265) do (
    rem 获取文件名（不含扩展名）和文件所在的文件夹
    set "filename=%%~nf"
    set "folder=%%~dpf"

    rem 提取文件名中的 x, y, z 部分
    for /f "tokens=1,2,3 delims=_" %%a in ("!filename!") do (
        set "x=%%a"
        set "y=%%b"
        set "z=%%c"
    )

    rem 提取分辨率和帧率
    set "resolution=1920x1080"  rem 分辨率固定为 1920x1080
    set "framerate=!z:~0,2!"    rem 提取帧率（假设帧率是 z 的前两个字符）

    rem 构造输出文件名
    set "output_file=!folder!!filename!.yuv"

    rem 使用 ffmpeg 进行解压缩
    ffmpeg -i "%%f" -s !resolution! -r !framerate! -pix_fmt yuv420p "!output_file!"

    rem 检查是否生成成功
    if exist "!output_file!" (
        echo Decompressed "%%f" to "!output_file!"
    ) else (
        echo Failed to decompress "%%f"
    )
)

echo All files processed.
pause