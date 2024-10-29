#!/bin/bash

# 切換到腳本所在的目錄
cd "$(dirname "$0")"

# 抓取當前目錄
CURRENT_DIR=$(pwd)

# 指定要打開的文件
FILE_PATH="${CURRENT_DIR}/index.html"

# 構建完整的 file:// 路徑
FILE_URL="file://${FILE_PATH}"

# 使用 Chrome 打開文件並禁用 CORS
open -n -a "Google Chrome" --args --disable-web-security --user-data-dir="/tmp/ChromeDev" "$FILE_URL"

# # 使用 osascript 打開 Chrome 並指定禁用 CORS 的選項
# osascript <<EOF
# tell application "Google Chrome"
#     activate
#     if (count of windows) is 0 then
#         set newWindow to make new window
#         tell newWindow
#             set URL of active tab to "$FILE_URL"
#         end tell
#     else
#         tell window 1
#             set URL of active tab to "$FILE_URL"
#         end tell
#     end if
# end tell

# do shell script "open -n -a 'Google Chrome' --args --disable-web-security --user-data-dir='/tmp/ChromeDev'"
# EOF
